class Admin::TransactionsController < AdminController
  before_action :set_employee
  before_action :set_transaction, only: [:show, :destroy]

  # GET /admin/transactions
  # GET /admin/transactions.json
  def index
    @transactions = if @employee
      @employee.transactions
    else
      Transaction.all
    end

    if params[:card_type_id].present?
      @transactions = @transactions.joins(card: :card_type).where("card_types.id IN (?)", params[:card_type_id])
    end

    date_range = FormDateRange.new(params[:duration])
    if date_range.present?
      @transactions = @transactions.where(transaction_at: date_range.time_range)
    end

    @transactions_count = @transactions.count

    if params[:group_by].present?
      @transactions = @transactions.group_by { |m| m.transaction_at.beginning_of_month }
    end
  end

  # GET /admin/transactions/1
  # GET /admin/transactions/1.json
  def show
  end

  # DELETE /admin/transactions/1
  # DELETE /admin/transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to admin_transactions_url, notice: 'MCC was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:employee_id]) if params[:employee_id].present?
    end

    def set_transaction
      @transaction = Transaction.find(params[:id])
    end
end
