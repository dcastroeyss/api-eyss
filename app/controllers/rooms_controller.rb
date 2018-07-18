class RoomsController < ApplicationController
  def create
    room = Room.new(params_permit)
    if room.valid?
      room.save 
      render json: {room:room, errors: room.errors.full_messages, status: 201, saved: true}
    else 
      render json: {errors: room.errors.full_messages, status: 201, saved: false}
    end  
  end 

  def index 
    render json: {room: Room.all, status: 201}
  end

  private 

  def params_permit 
    params.permit( :type_room_id )
  end 
end
