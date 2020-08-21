class CreateSequence

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
  rescue => ex
    puts "GODAMNIT #{ex}"
    raise ex
  end

end
