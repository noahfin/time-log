class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :day_id

      t.timestamps null: false
    end
  end
end