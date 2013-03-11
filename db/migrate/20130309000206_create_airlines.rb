class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.string :name
      t.string :icao_code
      t.string :aoc_number
      t.string :url
      t.string :phone

      t.timestamps
    end
  end
end
