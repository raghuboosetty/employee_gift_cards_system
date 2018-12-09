class Card < ApplicationRecord
  belongs_to :card_type
  belongs_to :employee, optional: true
end

# == Schema Information
#
# Table name: cards
#
#  id           :integer          not null, primary key
#  card_type_id :integer
#  employee_id  :integer
#  card_number  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_cards_on_card_type_id  (card_type_id)
#  index_cards_on_employee_id   (employee_id)
#