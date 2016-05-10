class AddStateToCities < ActiveRecord::Migration
  def change
    add_column :cities, :state, :string
  end
end
