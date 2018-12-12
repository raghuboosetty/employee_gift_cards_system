class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.belongs_to :employee, foreign_key: true
      t.belongs_to :card, foreign_key: true
      t.belongs_to :merchant_category_code
      t.string :transaction_id, null: false
      t.string :mcc, null: false
      t.string :merchant_name, null: false
      t.decimal :tax_amount, null: false      
      t.decimal :amount, null: false
      t.string :status, null: false
      t.datetime :transaction_at, null: false
      t.string :error_message

      t.timestamps
    end
  end
end
