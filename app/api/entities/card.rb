module Entities
  class Card < Grape::Entity
    expose :card_number
    expose :card_type, using: 'Entities::CardType'
  end
end
