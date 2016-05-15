class AddHomeIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :home, index: true, foreign_key: true
  end
end
