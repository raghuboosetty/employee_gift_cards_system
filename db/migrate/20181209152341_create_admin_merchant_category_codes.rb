class CreateAdminMerchantCategoryCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :merchant_category_codes do |t|
      t.integer :limit, limit: 6
      t.string :code, limit: 3

      t.timestamps
    end
  end
end
