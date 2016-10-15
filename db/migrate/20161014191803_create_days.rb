class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps null: false
    end
  end
end
