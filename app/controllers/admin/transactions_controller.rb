class Admin::TransactionsController < AdminController
  before_action :set_transaction, only: [:show, :destroy]

  # GET /admin/transactions
  # GET /admin/transactions.json
  def index
    @transactions = Transaction.all
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
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end
end
