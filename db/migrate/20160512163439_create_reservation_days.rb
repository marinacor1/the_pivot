class CreateReservationDays < ActiveRecord::Migration
  def change
    create_table :reservation_days do |t|
      t.references :day, index: true, foreign_key: true
      t.references :reservation, index: true, foreign_key: true
    end
  end
end
