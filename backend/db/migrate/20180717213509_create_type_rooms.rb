class CreateTypeRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :type_rooms do |t|
      t.string :price
      t.string :type

      t.timestamps
    end
  end
end
