class AddThoughtsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :thoughts, :text
  end
end
