class AddUserToReservations < ActiveRecord::Migration
  def change
    add_reference :reservations, :user, index: true, foreign_key: true
  end
end
