class AddStatusToHomes < ActiveRecord::Migration
  def change
    add_column :homes, :pending, :boolean, default: false
  end
end
