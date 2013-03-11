class AddTableToTravelers < ActiveRecord::Migration
  def change
    change_table :travelers do |t|
      t.integer :flight_id
    end
  end
end
