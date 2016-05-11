class RenameCategoriesToCities < ActiveRecord::Migration
  def change
    rename_table :categories, :cities
  end
end
