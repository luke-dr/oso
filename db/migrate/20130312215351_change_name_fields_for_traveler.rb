class ChangeNameFieldsForTraveler < ActiveRecord::Migration
  def change
    add_column :travelers, :lastname, :string
    rename_column :travelers, :name, :firstname
  end
end
