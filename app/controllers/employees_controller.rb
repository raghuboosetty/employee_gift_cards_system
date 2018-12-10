class EmployeesController < EmployeeDashController
  before_action :set_employee, only: :show

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = current_employee
    end
end
