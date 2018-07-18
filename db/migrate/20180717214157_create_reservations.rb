class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :room_id
      t.date :date_begin
      t.date :date_end

      t.timestamps
    end
  end
end
