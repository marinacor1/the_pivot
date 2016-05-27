class AddReservationIdToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :reservation, index: true, foreign_key: true
  end
end
