class RemoveItineraryColumnFromUsers < ActiveRecord::Migration
  def change
    rename_column :itineraries, :traveler_id, :user_id
    remove_column :users, :itinerary_id
  end
end
