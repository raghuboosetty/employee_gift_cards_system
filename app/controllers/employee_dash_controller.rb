class EmployeeDashController < ApplicationController
  before_action :authenticate_employee!

protected
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || employee_path(current_employee)
  end
end
