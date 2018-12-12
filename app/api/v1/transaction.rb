module V1
  class Transaction < Grape::API

    resource :transaction do
      desc "New Transaction Request"
      params do
        requires :id, type: String, desc: "Transaction ID"
        requires :merchant_code, type: String, desc: "Merchant Code"
        requires :card_number, type: String, desc: "Card Number"
        requires :amount, type: Float, desc: "Amount"
        requires :merchant_name, type: String, desc: "Merchant Name"
        optional :mobile_number, type: Integer, desc: "Mobile Number"
        optional :created, type: Integer, desc: "Created At(UNIX)"
      end
      post do 
        card = Card.find_by_card_number(params[:card_number])
        transaction = card.create_transaction(params)
        if transaction && !transaction.new_record? && transaction.successful?
          status 201
          { message: 'Successful' }
        else
          errors = 'Request Denied!'
          if transaction.error_message.present?
            errors = transaction.error_message
          end
          error!(errors, 403)
        end
      end
    end

    # resource :payment_response do
    #   desc "Payment Response"
    #   params do
    #     requires :transaction_id, type: String, desc: "Transaction ID"
    #     requires :card_number, type: String, desc: "Card Number"
    #     requires :status, type: String, desc: "Status"
    #   end
    #   post do
    #     card = Card.find_by_card_number(params[:card_number])
    #     transaction = card.update_transaction(params)
    #     if transaction && !transaction.new_record? && transaction.approved?
    #       status 200
    #       present 'Request Allowed'
    #     else
    #       errors = 'Request Denied!'
    #       if transaction.error_message.present?
    #         errors = transaction.error_message
    #       end
    #       error!(errors, 403 )
    #     end
    #   end
    # end

  end
end