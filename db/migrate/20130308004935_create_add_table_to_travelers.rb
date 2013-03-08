class AddTableToTravelers < ActiveRecord::Migration
  def change
    add_column :travelers, :flight_id, :integer
  end
end
