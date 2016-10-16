class AddUserToDayLogs < ActiveRecord::Migration
  def change
    add_reference :day_logs, :user, index: true, foreign_key: true
  end
end
