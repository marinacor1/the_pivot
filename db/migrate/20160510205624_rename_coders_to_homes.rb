class RenameCodersToHomes < ActiveRecord::Migration
  def change
    rename_table :coders, :homes
  end
end
