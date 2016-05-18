class ChangeZipcodeToHomes < ActiveRecord::Migration
  def change
    change_column :homes, :zip_code, :string
  end
end
