class SimplifiedInvoice < Invoice

  def fill_received_po_id
    # do nothing for simplified invoices
    true
  end

  def saft_document_type
    "FS"
  end

end
