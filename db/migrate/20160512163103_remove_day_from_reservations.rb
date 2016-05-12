class RemoveDayFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :day_id
  end
end
