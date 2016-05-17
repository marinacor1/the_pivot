class AddStatusToHomes < ActiveRecord::Migration
  def change
    add_column :homes, :status, :string
  end
end
