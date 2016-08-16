class AddReviewidToTrips < ActiveRecord::Migration
  def change
    add_reference :trips, :review, index: true, foreign_key: true
  end
end
