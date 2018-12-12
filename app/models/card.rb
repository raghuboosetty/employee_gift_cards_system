class Card < ApplicationRecord
  has_many :transactions
  belongs_to :card_type
  belongs_to :employee, optional: true

  validates :card_number, :employee_id, presence: true, uniqueness: true

  def pending_limit_in_given_month(merchant_code, timestamp)
    merchant_category_code = card_type.merchant_category_codes.where(code: merchant_code).first
    if merchant_category_code
      default_mcc_monthly_limit = merchant_category_code.limit
      used_mcc_limit_this_month = transactions.in_month_of(timestamp).successful.where(merchant_category_code_id: merchant_category_code.id).sum(:tax_amount)
      (default_mcc_monthly_limit - used_mcc_limit_this_month).to_f
    else
      -1 # when MCC is not in given card
    end
  end

  def transaction_allowed?(merchant_code)
    pending_limit_in_given_month(merchant_code) > 0
  end

  def mcc_default_monthly_limits
    @mcc_default_monthly_limits ||= card_type.merchant_category_codes.pluck(:code, :limit).to_h
  end

  def create_transaction(attrs={})
    transaction = transactions.new

    if attrs[:created].present?
      transaction.transaction_at  = Time.at(attrs[:created].to_i)
    else
      transaction.transaction_at  = Time.now
    end

    pending_limit = pending_limit_in_given_month(attrs[:merchant_code], transaction.transaction_at)

    if pending_limit > 0
      transaction.status = Transaction::PAYMENT_STATUSES[:success]
    else
      transaction.status = Transaction::PAYMENT_STATUSES[:denied]
    end

    if pending_limit > attrs[:amount]
      transaction.tax_amount = attrs[:amount]
    elsif pending_limit < 0
      transaction.tax_amount = 0
    else
      transaction.tax_amount = pending_limit
    end

    transaction.employee_id = self.employee_id
    transaction.card_id = self.id
    transaction.merchant_category_code_id = card_type.merchant_category_codes.where(code: attrs[:merchant_code]).first.try(:id)

    transaction.mcc = attrs[:merchant_code]
    transaction.transaction_id = attrs[:id]
    transaction.merchant_name = attrs[:merchant_name]
    transaction.amount = attrs[:amount]

    if pending_limit.zero?
      transaction.error_message = Transaction::ERROR_MESSAGES[:mcc_not_allowed]
    end
    
    if pending_limit == -1
      transaction.error_message = Transaction::ERROR_MESSAGES[:mcc_not_allowed]
    end

    transaction.save

    if transaction.errors.any?
      transaction.error_message = transaction.errors.full_messages.join(', ')
    end

    transaction
  end

  # def update_transaction(attrs={})
  #   transaction = transactions.where(transaction_id: attrs[:transaction_id])
  # end

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
#  index_cards_on_employee_id   (employee_id) UNIQUE
#
