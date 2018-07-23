class AddForegeinKeyToRoomTypeRoomAndReservationToRoom < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :type_id, :integer
    add_column :rooms, :type_room_id, :integer
    add_foreign_key :rooms, :type_rooms
    add_foreign_key :reservations, :rooms 
    add_foreign_key :reservations, :users    
  end
end