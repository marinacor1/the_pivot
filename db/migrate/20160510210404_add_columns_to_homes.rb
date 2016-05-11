class AddColumnsToHomes < ActiveRecord::Migration
  def change
    add_column :homes, :address, :string
    add_column :homes, :zip_code, :integer
    add_column :homes, :title, :string
    add_column :homes, :description, :string
    add_column :homes, :daily_rate, :decimal
    add_reference :homes, :city, index: true, foreign_key: true
    add_reference :homes, :user, index: true, foreign_key: true
  end
end
