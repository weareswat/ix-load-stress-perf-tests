class CreateSequence

  STATE_MANAGER_SEQUENCE_TABLE_NAME = "StateManager-Sequence-#{if Rails.env.test? || Rails.env.development?
                                                                 'Dev'
                                                               elsif  Rails.env.staging?
                                                                 'Staging'
                                                               elsif  Rails.env.production?
                                                                 'Production'
                                                               end}"

  def self.run!(account, name, params={})
    interactor = self.new(account, name, params)
    interactor.run!
  end

  attr_accessor :account, :serie_name, :params

  def initialize(account, name, params={})
    @account = account
    @serie_name = name
    @params = params
    @params[:sequence] ||= {}
  end

  def self.document_types
    @document_types ||= [
      Invoice,
      SimplifiedInvoice,
      InvoiceReceipt,
      Receipt,
      DebitNote,
      CreditNote,
      CashInvoice,
      
      VatMossInvoice,
      VatMossCreditNote,
      VatMossReceipt,

      PurchaseOrder,

      Quote,
      Proforma,
      FeesNote,

      Shipping,
      Devolution,
      Transport,
    ]
  end

  def each_document_type
    self.class.document_types.each do |doc|
      yield(doc)
    end
  end

  def run!
    sequences = []

    each_document_type do |document_type|
      table_name = document_type.name.tableize

      sequence = create_sequence(table_name)
      sequences << sequence
    end


    if  set_default_sequence?
      account.current_serie = serie_name
      account.save!
    end



  rescue Exception => ex
    raise ex
  end

  def set_default_sequence?
    params[:sequence][:default_sequence] == '1' ||
      params[:sequence][:default_sequence] == true ||
      params[:default_sequence] == true
  end

  def all_valid?(sequences)
    sequences.map{|s| s.valid?}.reduce(:&)
  end

  def create_sequence(table_name)
    sequence = account.send("#{table_name}_sequences").new

    sequence.category = table_name
    sequence.current_number = params[:sequence].fetch("current_#{table_name.singularize}_number") {0}
    sequence.serie = serie_name
    sequence.save

    sequence

    sync_dynamo_sequences_table(sequence)

  rescue => ex
    puts "GODAMNIT #{ex}"
    raise ex
  end

  def sync_dynamo_sequences_table(sequence)
    @@dynamo_manager ||= Aws::DynamoManager.new

    type = sequence.category.camelize.singularize

    item = {}
    item["SequenceId"] = "#{sequence.id}"
    item["AccountId_Type"] = "#{sequence.account_id}_#{type}"
    item["AccountId"] = "#{sequence.account_id}"
    item["Name"] = sequence.serie
    item["Type"] = type
    item["CurrentNumber"] = 0
    item["LastIssueDate"] = "1970-01-01 00:00:00 +0000"
    item["LastDueDate"] = ""
    item["LastSaftHash"] = "0"
    item["LastEncryptedDoc"] = "0"

    @@dynamo_manager.create_item(STATE_MANAGER_SEQUENCE_TABLE_NAME, item)
  end

end
