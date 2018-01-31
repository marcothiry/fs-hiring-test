require 'pry'

class UsersController < ApplicationController


  def show
    @motel = User.motel(current_user)
    @rooms = User.rooms(current_user)
    @bookings = User.bookings(current_user)
    @sales_brl = User.sales_brl(current_user)
    @fees_brl = User.fees_brl(current_user)
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
