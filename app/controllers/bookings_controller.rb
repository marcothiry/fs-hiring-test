class BookingsController < ApplicationController
  before_action :load_bookings, only: [:index, :show]

  def index

  end

  def show
    @booking = @bookings.select { |booking| booking.id == params[:id] }
  end


private

  def load_bookings
    @bookings = Booking.where(motel_id: params[:motel_id])
  end

end
