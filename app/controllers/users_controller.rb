require 'pry'

class UsersController < ApplicationController
  helper_method :room_bookings

  def room_bookings(room, user)
      Booking.where(motel_id: user.motel_id).select { |booking| booking.room_id == room.id }
  end

  def room_bookings_type

  end

  def room_bookings_by_type

  end

  def show
    @motel = User.motel(current_user)
    @rooms = User.rooms(current_user)
    @bookings = User.bookings(current_user)
    @sales_brl = User.sales_brl(current_user)
    @fees_brl = User.fees_brl(current_user).round(2)
    @average_fee_percent = ((@fees_brl / (@sales_brl)) * 100).round(2)
    @revenue = @sales_brl - @fees_brl
    @average_time_of_stay = User.average_time_of_stay(current_user)
    @unique_days = User.unique_days(current_user)



  end

  def edit
  end

  def update
  end



end
