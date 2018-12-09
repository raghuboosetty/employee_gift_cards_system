class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :card_type
      t.references :employee
      t.integer :card_number, limit: 16

      t.timestamps
    end
  end
end
