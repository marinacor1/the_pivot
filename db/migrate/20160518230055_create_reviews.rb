class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :home, index: true, foreign_key: true
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
