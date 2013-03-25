class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :airline_code
      t.integer :flight_number
      t.string :departure_airport
      t.string :arrival_airport
      t.datetime :scheduled_departure_time
      t.datetime :scheduled_arrival_time
      t.string :status
      t.datetime :actual_departure_time
      t.datetime :actual_departure_time
      t.references :itinerary

      t.timestamps
    end
    add_index :flights, :itinerary_id
  end
end
