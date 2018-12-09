class AddColumnsToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :employee_id, :string, limit: 20
    add_column :employees, :mobile_number, :integer, limit: 12
  end
end
