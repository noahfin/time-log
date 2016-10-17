class AddWeekStartToWeeks < ActiveRecord::Migration
  def change
    add_column :weeks, :week_strat, :string
  end
end
