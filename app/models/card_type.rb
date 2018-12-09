class CardType < ApplicationRecord
  has_many :cards
  has_and_belongs_to_many :merchant_category_codes
end

# == Schema Information
#
# Table name: card_types
#
#  id         :integer          not null, primary key
#  name       :string(50)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
