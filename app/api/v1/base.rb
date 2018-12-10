require "grape-swagger"

module V1
  class Base < Grape::API
    mount V1::Transaction
  end
end