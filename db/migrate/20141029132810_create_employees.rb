class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.decimal :pay_rate

      t.timestamps
    end
  end
end
