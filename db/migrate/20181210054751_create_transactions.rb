class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.belongs_to :employee, foreign_key: true
      t.belongs_to :card, foreign_key: true
      t.belongs_to :merchant_category_code, foreign_key: true
      t.string :transaction_id
      t.string :merchant_name
      t.decimal :amount
      t.string :status

      t.timestamps
    end
  end
end
