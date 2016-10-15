class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.datetime :date
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
