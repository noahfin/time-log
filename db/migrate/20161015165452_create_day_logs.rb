class CreateDayLogs < ActiveRecord::Migration
  def change
    create_table :day_logs do |t|
      t.string :day
      t.string :time_in
      t.string :time_out

      t.timestamps null: false
    end
  end
end
