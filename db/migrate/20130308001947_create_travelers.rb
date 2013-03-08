class CreateTravelers < ActiveRecord::Migration
  def change
    create_table :travelers do |t|
      t.string :name
      t.string :email
      t.integer :itinerary_id

      t.timestamps
    end
  end
end
