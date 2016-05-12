class AddReservationToDays < ActiveRecord::Migration
  def change
    add_reference :days, :reservation, index: true, foreign_key: true
  end
end
