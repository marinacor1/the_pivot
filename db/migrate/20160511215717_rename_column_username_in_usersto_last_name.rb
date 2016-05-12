class RenameColumnUsernameInUserstoLastName < ActiveRecord::Migration
  def change
    rename_column :users, :username, :last_name
  end
end
