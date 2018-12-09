class CreateCardTypesMerchantCategoryCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :card_types_merchant_category_codes do |t|
      t.belongs_to :card_type, index: {name: "index_cts_mccs_on_ct_id"}
      t.belongs_to :merchant_category_code, index: {name: "index_cts_mccs_on_mcc_id"}
    end
  end
end