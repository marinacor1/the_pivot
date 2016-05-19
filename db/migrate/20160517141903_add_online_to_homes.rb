class AddOnlineToHomes < ActiveRecord::Migration
  def change
    add_column :homes, :online, :boolean, default: true, null: false
  end
end
