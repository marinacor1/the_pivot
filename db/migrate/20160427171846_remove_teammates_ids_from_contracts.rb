class RemoveTeammatesIdsFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :teammates_ids, :text
  end
end
