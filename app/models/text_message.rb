class TextMessage < ApplicationRecord
  belongs_to :track
  belongs_to :invoice
  belongs_to :parent
  belongs_to :membership
  belongs_to :account
end
