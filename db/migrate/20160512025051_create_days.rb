class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date :date
    end
  end
end
