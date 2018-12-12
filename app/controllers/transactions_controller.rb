class TransactionsController < EmployeeDashController
  before_action :set_transaction, only: :show

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = current_employee.transactions
    
    date_range = FormDateRange.new(params[:duration])
    if date_range.present?
      @transactions = @transactions.where(transaction_at: date_range.time_range)
    end
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
