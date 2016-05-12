class ChangeReservationColumns < ActiveRecord::Migration
  def change
    remove_column :reservaions, :coder_id
    remove_column :reservaions, :contract_id
    remove_column :reservaions, :cost
    add_reference :reservaions, :day, index: true
    add_reference :reservaions, :home, index: true
    add_reference :reservaions, :trip, index: true
  end
end
