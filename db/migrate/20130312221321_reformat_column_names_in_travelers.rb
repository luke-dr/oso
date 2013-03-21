class ReformatColumnNamesInTravelers < ActiveRecord::Migration
  def change
    rename_column :travelers, :firstname, :first_name
    rename_column :travelers, :lastname, :last_name
  end
end
