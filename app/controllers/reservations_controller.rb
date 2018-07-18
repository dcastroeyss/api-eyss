class ReservationsController < ApplicationController

  before_action :verify_token
  before_action :verify_reservation, only: [:show,:update,:destroy]

  def create 
    reservation = Reservation.new(params_permit)
    if reservation.valid?
      reservation.save 
      render json: {reservation:reservation.as_json( include: [room: { include: {type_room: {}}}]), errors: reservation.errors.full_messages, status: 201, saved: true}
    else 
      render json: {errors: reservation.errors.full_messages, status: 201, saved: false}
    end
  end

  def show 
    render json: {reservation: Reservation.find(params[:id]).as_json( include: [room: { include: {type_room: {}}}]), status: 201}
  end

  def update 
    reservation = Reservation.find(params[:id])
    render json: {reservation: Reservation.update(reservation.id, params_permit).as_json( include: [room: { include: {type_room: {}}}]), status: 201}
  end 

  def destroy 
    reservation = Reservation.find(params[:id]).destroy
    render json: {reservation: nil, status: 201}
  end

  def index 
    render json: {reservations: Reservation.all.as_json( include: [room: { include: {type_room: {}}}]), status: 201}
  end

  private 

  def params_permit 
    params.permit( :user_id, :room_id, :date_begin, :date_end)
  end

  def verify_token 
    if !User.exists?(token: params[:token])
      render json: {response: 'token invalid'} 
    end 
  end 

  def verify_reservation
    if !Reservation.exists?(params[:id])
      render json: {status: 201, reservation: nil}
    end 
  end
end
