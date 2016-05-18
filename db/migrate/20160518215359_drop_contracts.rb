class DropContracts < ActiveRecord::Migration
  def change
    drop_table :contracts
  end
end
