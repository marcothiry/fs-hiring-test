class RoomsController < ApplicationController
  before_action :load_rooms, only: [:show, :index]
  def index
  end

  def show
    @room = Room.where(motel_id: current_user.motel_id).select { |room| room.id == params[:id].to_i}

    @bookings = Booking.where(motel_id: current_user.motel_id).select { |booking| booking.room_id == params[:id].to_i }

  end


  private

  def load_rooms
    @rooms = Room.where(motel_id: params[:motel_id])
  end
end
