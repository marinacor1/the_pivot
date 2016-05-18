class AddTitleToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :title, :text
  end
end
