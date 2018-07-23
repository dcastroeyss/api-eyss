class Reservation < ApplicationRecord
  validates :user_id, :room_id, :date_begin, :date_end, presence: true
  belongs_to :room 
  belongs_to :user
end
