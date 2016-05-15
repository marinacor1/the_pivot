class RemoveUserIdFromHomes < ActiveRecord::Migration
  def change
    remove_column :homes, :user_id
  end
end
