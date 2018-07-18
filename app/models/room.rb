class Room < ApplicationRecord
  belongs_to :type_room
  validates :type_room_id, presence: true
end
