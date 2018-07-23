class EditColumnTpyeRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :type_rooms, :type, :integer
    add_column :type_rooms, :name, :integer
  end
end
