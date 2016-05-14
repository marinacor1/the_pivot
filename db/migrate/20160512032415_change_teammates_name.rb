class ChangeTeammatesName < ActiveRecord::Migration
  def change
    rename_table :teammates, :reservaions
  end
end
