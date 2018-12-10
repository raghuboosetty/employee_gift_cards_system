class TransactionsController < EmployeeDashController
  before_action :set_transaction, only: :show

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = current_employee.transactions
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = current_employee.transactions.find(params[:id])
    end
end
