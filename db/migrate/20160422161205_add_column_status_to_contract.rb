class AddColumnStatusToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :status, :string, default: "Contracted"
  end
end
