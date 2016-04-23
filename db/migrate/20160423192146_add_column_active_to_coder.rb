class AddColumnActiveToCoder < ActiveRecord::Migration
  def change
    add_column :coders, :active, :boolean, :default => true
  end
end
