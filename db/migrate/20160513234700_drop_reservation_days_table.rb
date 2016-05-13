class DropReservationDaysTable < ActiveRecord::Migration
  def change
    drop_table :reservation_days
  end
end
