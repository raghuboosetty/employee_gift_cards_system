class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.belongs_to :card_type
      t.belongs_to :employee, index: { unique: true }
      t.integer :card_number, limit: 16

      t.timestamps
    end
  end
end
