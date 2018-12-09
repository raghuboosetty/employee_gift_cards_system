class Admin::MerchantCategoryCodesController < AdminController
  before_action :set_merchant_category_code, only: [:show, :edit, :update, :destroy]

  # GET /admin/merchant_category_codes
  # GET /admin/merchant_category_codes.json
  def index
    @merchant_category_codes = MerchantCategoryCode.all
  end

  # GET /admin/merchant_category_codes/1
  # GET /admin/merchant_category_codes/1.json
  def show
  end

  # GET /admin/merchant_category_codes/new
  def new
    @merchant_category_code = MerchantCategoryCode.new
  end

  # GET /admin/merchant_category_codes/1/edit
  def edit
  end

  # POST /admin/merchant_category_codes
  # POST /admin/merchant_category_codes.json
  def create
    @merchant_category_code = MerchantCategoryCode.new(merchant_category_code_params)

    respond_to do |format|
      if @merchant_category_code.save
        format.html { redirect_to [:admin, @merchant_category_code], notice: 'MCC was successfully created.' }
        format.json { render :show, status: :created, location: @merchant_category_code }
      else
        format.html { render :new }
        format.json { render json: @merchant_category_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/merchant_category_codes/1
  # PATCH/PUT /admin/merchant_category_codes/1.json
  def update
    respond_to do |format|
      if @merchant_category_code.update(merchant_category_code_params)
        format.html { redirect_to [:admin, @merchant_category_code], notice: 'MCC was successfully updated.' }
        format.json { render :show, status: :ok, location: @merchant_category_code }
      else
        format.html { render :edit }
        format.json { render json: @merchant_category_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/merchant_category_codes/1
  # DELETE /admin/merchant_category_codes/1.json
  def destroy
    @merchant_category_code.destroy
    respond_to do |format|
      format.html { redirect_to admin_merchant_category_codes_url, notice: 'MCC was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchant_category_code
      @merchant_category_code = MerchantCategoryCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merchant_category_code_params
      params.require(:merchant_category_code).permit(:name, :limit, :code)
    end
end
