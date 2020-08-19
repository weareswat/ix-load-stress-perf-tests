class FulltextRow < ApplicationRecord
  belongs_to :fulltextable
  belongs_to :parent
end
