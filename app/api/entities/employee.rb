module Entities
  class Employee < Grape::Entity
    expose :employee_id
    expose :mobile_number
  end
end
