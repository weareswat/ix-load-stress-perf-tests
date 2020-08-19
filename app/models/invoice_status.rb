class InvoiceStatus
  def self.all
    [draft, deleted, sent, second_copy, canceled, settled, refused,
     completed, accepted]
  end

  def self.accounting_relevant
    [sent, settled, second_copy]
  end

  def self.accounting_possible
    [draft, sent, settled, canceled, second_copy]
  end

  def self.status_communicable_to_at
    [settled, second_copy, sent, canceled]
  end

  def self.working_documents_status
    [sent, accepted, completed, refused, canceled, second_copy]
  end

  def self.purchase_orders_status
    [draft, sent, second_copy, canceled, completed, refused, accepted]
  end

  def self.estimates_status
    [draft, sent, canceled, accepted, refused]
  end

  def self.status_communicable
    [
      sent,
      settled,
      second_copy,
      canceled,
      accepted,
      refused,
      completed
    ]
  end

  def self.relevant_status_to_at
    [second_copy, sent, canceled]
  end

  def self.search_relevant_guides
    [draft, sent, canceled, second_copy]
  end

  def self.draft
    'draft'
  end

  def self.deleted
    'deleted'
  end

  def self.sent
    'sent'
  end

  def self.second_copy
    'second_copy'
  end

  def self.canceled
    'canceled'
  end

  def self.settled
    'settled'
  end

  def self.refused
    'refused'
  end

  def self.completed
    'completed'
  end

  def self.accepted
    'accepted'
  end

  def self.to_be_settled
    [sent, second_copy]
  end
end
