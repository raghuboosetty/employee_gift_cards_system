module V1
  class Transaction < Grape::API

    resource :transaction_request do
      desc "Transaction Request"
      params do
        requires :transaction_id, type: String, desc: "Transaction ID"
        requires :mobile_number, type: Integer, desc: "Mobile Number"
        requires :merchant_code, type: String, desc: "Merchant Code"
        requires :merchant_name, type: String, desc: "Merchant Name"
        requires :card_number, type: String, desc: "Card Number"
        requires :amount, type: Float, desc: "Amount"
      end
      post do
        error!('User mismatch', 400) 
      end
    end

    resource :payment_response do
      desc "Payment Response"
      params do
        requires :transaction_id, type: String, desc: "Transaction ID"
        requires :mobile_number, type: Integer, desc: "Mobile Number"
        requires :merchant_code, type: String, desc: "Merchant Code"
        requires :merchant_name, type: String, desc: "Merchant Name"
        requires :card_number, type: String, desc: "Card Number"
        requires :amount, type: Float, desc: "Amount"
        requires :payment_status, type: Boolean, desc: "Payment Status"
      end
      post do

      end
    end

  end
end