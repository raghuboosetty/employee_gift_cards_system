class Card < ApplicationRecord
  belongs_to :card_type
  belongs_to :employee, optional: true
end
