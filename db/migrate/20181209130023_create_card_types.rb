class CreateCardTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :card_types do |t|
      t.string :name, limit: 50
      t.timestamps
    end
  end
end
