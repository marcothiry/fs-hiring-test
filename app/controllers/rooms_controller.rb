class RoomsController < ApplicationController
  before_action :load_rooms, only: [:show, :index]
  def index
  end

  def show
  end


  private

  def load_rooms
    @rooms = Room.where(motel_id: params[:motel_id])
  end
end
