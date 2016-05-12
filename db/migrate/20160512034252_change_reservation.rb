class ChangeReservation < ActiveRecord::Migration
  def change
    rename_table :reservaions, :reservations
  end
end
