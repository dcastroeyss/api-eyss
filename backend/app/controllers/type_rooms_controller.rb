class TypeRoomsController < ApplicationController

  def create 
    type_room = TypeRoom.new(params_permit)
    if type_room.valid?
      type_room.save 
      render json: {type_room:type_room, errors: type_room.errors.full_messages, status: 201, saved: true}
    else 
      render json: {errors: type_room.errors.full_messages, status: 201, saved: false}
    end 
  end 

  def index 
    render json: {type_rooms: TypeRoom.all, status: 201}
  end 

  private

  def params_permit
    params.permit( :price, :name) 
  end 
end
