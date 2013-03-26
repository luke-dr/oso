class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :string, :string
    add_column :users, :itinerary_id, :integer

    drop_table :travelers
  end
end
