class AddPendingToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :pending, :boolean, default: true
  end
end
