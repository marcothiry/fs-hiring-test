
class UsersController < ApplicationController


  def show

    @motel = Motel.all.select { |motel| motel.id == current_user.motel_id }
    @rooms = Room.where(motel_id: current_user.motel_id)
    @bookings = Booking.where(motel_id: current_user.motel_id)

    @sales_brl = @bookings.map {|s| (s.amount_centavos / 100.00 ) }.reduce(0, :+)
    @fees = @bookings.map { |s| (s.amount_centavos * s.fee_percentage / (100*100.00)) }.reduce(0, :+)
    @average_fee_percent = (@fees / (@sales_brl * 100)).round(2)

  end

  def edit
  end

  def update
  end






end
