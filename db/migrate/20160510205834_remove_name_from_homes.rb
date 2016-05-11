class RemoveNameFromHomes < ActiveRecord::Migration
  def change
    remove_column :homes, :name, :string
    remove_column :homes, :experience, :string
    remove_column :homes, :cost, :string
    remove_column :homes, :category_id, :integer
    remove_column :homes, :active, :boolean
  end
end
