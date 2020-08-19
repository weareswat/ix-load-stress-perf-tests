class Guide < Invoice
  belongs_to :address_to, :class_name => 'Address', optional: true
  belongs_to :address_from, :class_name => 'Address', optional: true
  
  def self.types
    [
      Shipping,
      Devolution,
      Transport
    ]
  end
end