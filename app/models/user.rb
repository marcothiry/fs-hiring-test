class User < ApplicationRecord
  # Include default devise modules. Others available are:
  include RoomBooking
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :motel

  def self.motel(user)
    Motel.all.select { |motel| motel.id == user.motel_id }
  end

  def self.bookings(user)
    Booking.where(motel_id: user.motel_id)
  end

  def self.rooms(user)
    Room.where(motel_id: user.motel_id)
  end

  def self.sales_brl(user)
    User.bookings(user).map { |s| (s.amount_centavos / 100.00 ) }.reduce(0, :+)
  end

  def self.fees_brl(user)
   User.bookings(user).map { |f| (f.amount_centavos * f.fee_percentage / (100*100.00)) }.reduce(0, :+)
  end

  def self.average_time_of_stay(user)
    (User.bookings(user).map { |t| t.booking_period[/\d+/].to_i }.reduce(0, :+)) / (User.bookings(user).count)
  end

  def self.unique_days(user)
    unique_days = []
    day_types = User.bookings(user).uniq { |unique_bookings| unique_bookings.booking_period[/\w+$/] }
    day_types.each { |booking| unique_days << booking.booking_period[/\w+$/] }
    return unique_days
  end



end
