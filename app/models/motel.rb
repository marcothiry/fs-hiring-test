require 'active_resource'

class Motel < ActiveResource::Base

  self.site = "https://luvotels-hiring-api.herokuapp.com"
  has_many :rooms
  has_many :bookings
  belongs_to :user


end
