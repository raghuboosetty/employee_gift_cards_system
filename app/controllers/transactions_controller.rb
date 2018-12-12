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

    @transactions_count = @transactions.count

    if params[:group_by].present?
      @transactions = @transactions.group_by { |m| m.transaction_at.beginning_of_month }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  def export
    GenerateReportJob.perform_later params.permit(Export::TransactionsExport.keys), current_employee
    redirect_back(fallback_location: transactions_path, notice: 'Request is being processed in background, please check your email')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = current_employee.transactions.find(params[:id])
    end
end
