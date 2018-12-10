class CardType < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_and_belongs_to_many :merchant_category_codes, -> { distinct }

  validates :name, presence: true, uniqueness: true
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
