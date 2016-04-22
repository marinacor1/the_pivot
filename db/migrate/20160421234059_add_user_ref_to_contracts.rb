class AddUserRefToContracts < ActiveRecord::Migration
  def change
    add_reference :contracts, :user, index: true, foreign_key: true
  end
end
