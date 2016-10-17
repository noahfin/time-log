class AddUserIdToUsers < ActiveRecord::Migration
  def change
    add_column :weeks, :user_id, :integer
  end
end
