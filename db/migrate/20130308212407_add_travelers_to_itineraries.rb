class AddTravelersToItineraries < ActiveRecord::Migration
  def change
    change_table :itineraries do |t|
      t.integer :traveler_id
    end
  end
end
