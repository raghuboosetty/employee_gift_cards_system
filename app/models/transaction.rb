class Transaction < ApplicationRecord
  belongs_to :employee
  belongs_to :card
  belongs_to :merchant_category_code

  validates :transaction_id, :merchant_name, :amount, :status, presence: true
  validates :transaction_id, uniqueness: true
end

# == Schema Information
#
# Table name: transactions
#
#  id                   :integer          not null, primary key
#  employee_id          :integer
#  card_id              :integer
#  merchant_category_id :integer
#  merchant_name        :string
#  amount               :decimal(, )
#  status               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_transactions_on_card_id               (card_id)
#  index_transactions_on_employee_id           (employee_id)
#  index_transactions_on_merchant_category_id  (merchant_category_id)
#
