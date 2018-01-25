class PagesController < ApplicationController

  def home
    @motels = Motel.all
  end

end
