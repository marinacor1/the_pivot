class CreateTeammates < ActiveRecord::Migration
  def change
    create_table :teammates do |t|
      t.references :coder, index: true, foreign_key: true
      t.references :contract, index: true, foreign_key: true
      t.string :cost
    end
  end
end
