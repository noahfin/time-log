class AddWeeksToUpDayLogs < ActiveRecord::Migration
  def change
    add_column :day_logs, :week_id, :integer
  end
end

