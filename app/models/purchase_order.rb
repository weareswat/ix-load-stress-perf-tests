class PurchaseOrder < Invoice
  #has_many :invoices, :foreign_key => "owner_invoice_id", :order => "created_at", :conditions => "(status='settled' or status='second_copy' or status='sent' or status='draft' or status='canceled')"

  #has_many :received_documents, :class_name => "Invoice",
  #         :foreign_key => "received_po_id",
  #         :conditions => "(status='settled' or status='second_copy' or status='sent' or status='canceled')" do
  #           def all_items
  #             ids = proxy_owner.received_documents.find(:all,:select => :id).map{|e| e.id}
  #             ids.empty? ? [] : InvoiceItem.by_invoice_ids(ids)
  #           end
  #         end
  #
  #after_save :mark_contact_as_supplier
  #validates_presence_of :loaded_at
  #
  #def mandatory_esignature?
  # false
  #end
  #
  #def mark_contact_as_supplier
  #  unless self.client_wrapper.supplier?
  #      self.client_wrapper.mark_as_supplier
  #  end
  #end
  #
  #def mark_contact_as_client
  #  #do nothing yeah!
  #end
  #
  #def invoiced_total
  #  received_documents.status(['settled', 'second_copy', 'sent']).by_type(["Invoice", "DebitNote"]).sum(:subtotal) - received_documents.status(['settled', 'second_copy', 'sent']).by_type(["CreditNote"]).sum(:subtotal)
  #end
  #
  #def taxed_invoiced_total
  #  received_documents.status(['settled', 'second_copy', 'sent']).by_type(["Invoice", "DebitNote"]).sum(:total) - received_documents.status(['settled', 'second_copy', 'sent']).by_type(["CreditNote"]).sum(:total)
  #end
  #
  #def received_documents_count
  #  received_documents.count
  #end
  #
  #def document_type=(type_attribute)
  #  if sequence_number.blank? || draft?
  #    self.type = type_attribute
  #  end
  #end
  #
  #def exceeded?
  #  balance < 0
  #end
  #
  #def will_exceed?(taxed_ammount)
  #  (taxed_balance - taxed_ammount) < 0
  #end
  #
  #def percent_completed
  #  (balance/subtotal)*100
  #end
  #
  #def balance
  #  self.subtotal - invoiced_total
  #end
  #
  #def taxed_balance
  #  self.total - taxed_invoiced_total
  #end
  #
  #def document_type
  #  read_attribute :type
  #end
  #
  #def all_series
  #  self.account.sequences.by_category('purchase_orders')
  #end
  #
  #def formated_type
  #  I18n.t("purchase_orders.Purchase_order")
  #end
  #
  #def credit_type?
  #  false
  #end
  #
  #def debit_type?
  #  false
  #end
  #
  #def accounting_relevant?
  #  false
  #end
  #
  #def loaded_at_aux
  #    I18n.localize(self.loaded_at, :format=> :uk_date) unless self.loaded_at.blank?
  # end
  #
  # def loaded_at_aux=(param)
  #    begin
  #      aux=Invoice.parse_custom_date(param)
  #      self.loaded_at = aux
  #    rescue
  #      self.loaded_at=nil
  #    end
  # end
  #
  # def items_balance
  #   items = received_documents.by_type(["Invoice", "DebitNote", "CreditNote"]).not_cancelled.all_items.map{|e| e.summary} + self.invoice_items.map{|e| e.summary}
  #   items = items.group_by{|e| e[:name]}
  #   items = items.map{|e| {:name => e.first, :remaining_quantity => e.second.sum{|e| e[:quantity]}}}
  # end
  #
  # def items_percent_complete
  #    items = self.invoice_items.map{|e| e.summary}
  #    items = items.group_by{|e| e[:name]}
  #    items = items.map{|e| {:name => e.first, :total_quantity => e.second.sum{|e| e[:quantity]}}}
  #    items = items_balance + items
  #
  #    items = items.group_by{|e| e[:name]}.map{|key,value|
  #      if value.second.kind_of?(Hash)
  #        value.first.merge(value.second)
  #      end
  #    }
  #    items.compact!
  #    items.map{|e| {:name => e[:name], :percentage => ((e[:total_quantity] - e[:remaining_quantity]) /e[:total_quantity]) * 100}}
  # end
  #
  # def remaining_items
  #   items_balance.reject{|e| e[:remaining_quantity] <= 0}
  # end
  #
  #def update_cache
  #  if !to_be_tracked?
  #    IX::Traits.documents.reset_has_purchase_orders(account_id).success?
  #  end
  #end
end
