class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.text :teammates_ids

      t.timestamps null: false
    end
  end
end
