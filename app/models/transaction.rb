class Transaction < ApplicationRecord
  default_scope { order(transaction_at: :desc) }

  belongs_to :employee
  belongs_to :card
  belongs_to :merchant_category_code, optional: true

  PAYMENT_STATUSES = { success: 'SUCCESS', denied: 'DENIED' }
  ERROR_MESSAGES = { 
    limit_reached: 'Monthly Limit Reached',
    mcc_not_allowed: 'Merchant Code Not Allowed'
   } 

  validates :transaction_id, :merchant_name, :amount, :status, :transaction_at, presence: true
  validates :transaction_id, uniqueness: true

  scope :in_this_month, -> { where("created_at > ? AND created_at < ?", Time.now.beginning_of_month, Time.now.end_of_month) }
  scope :in_month_of, ->(timestamp) { where("created_at > ? AND created_at < ?", timestamp.beginning_of_month, timestamp.end_of_month) }
  scope :successful, -> { where(status: Transaction::PAYMENT_STATUSES[:success]) }
  scope :failed, -> { where(status: Transaction::PAYMENT_STATUSES[:failed]) }

  def successful?
    status == Transaction::PAYMENT_STATUSES[:success]
  end
  
end

# == Schema Information
#
# Table name: transactions
#
#  id                        :integer          not null, primary key
#  employee_id               :integer
#  card_id                   :integer
#  merchant_category_code_id :integer
#  transaction_id            :string           not null
#  mcc                       :string           not null
#  merchant_name             :string           not null
#  tax_amount                :decimal(, )      not null
#  amount                    :decimal(, )      not null
#  status                    :string           not null
#  transaction_at            :datetime         not null
#  error_message             :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
# Indexes
#
#  index_transactions_on_card_id                    (card_id)
#  index_transactions_on_employee_id                (employee_id)
#  index_transactions_on_merchant_category_code_id  (merchant_category_code_id)
#
