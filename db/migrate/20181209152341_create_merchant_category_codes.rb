class CreateMerchantCategoryCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :merchant_category_codes do |t|
      t.string :name
      t.string :code, limit: 3
      t.integer :limit, limit: 6

      t.timestamps
    end
  end
end
