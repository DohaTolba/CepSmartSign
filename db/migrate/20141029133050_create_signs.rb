class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
      t.string :employee_id
      t.date :date
      t.time :check_in
      t.time :check_out

      t.timestamps
    end
  end
end
