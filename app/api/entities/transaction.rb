module Entities
  class Transaction < Grape::Entity
  expose :transaction_id
  expose :employee, using: 'Entities::Employee'
  expose :card, using: 'Entities::Card'
  expose :mcc
  expose :amount
  expose :status
  expose :transaction_at
  expose :error_message
  end
end
