class CreateCoders < ActiveRecord::Migration
  def change
    create_table :coders do |t|
      t.string :name
      t.string :experience
      t.string :image_url
      t.string :cost
      t.references :category, index: true, foreign_key: true
    end
  end
end
