module RoomBooking
  extend ActiveSupport::Concern

  def room_bookings(room, user)
    Booking.where(motel_id: user.motel_id).select { |booking| booking.room_id == room.id }
  end





end
