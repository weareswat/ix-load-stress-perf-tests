class Note < Invoice

  belongs_to :owner_invoice, :class_name => "Invoice"

  def client
    if self.owner_invoice.present?
      self.owner_invoice.client
    else
      super
    end
  end

  def document_client_version
    if self.owner_invoice == nil
      self.client.version
    else
      self.owner_invoice.client_version
    end
  end

  def change_client
    if owner_invoice_valid? && owner_invoice.unversioned_client.present?
      new_client = account.clients.find_by_id(owner_invoice.unversioned_client.id)
      self.client = new_client unless new_client.nil?
    else
      super
    end
  end

  def accounting_relevant?
    true
  end

  def supports_raw_owner_invoice?
    owner_invoice.nil?
  end
end