class MotelsController < ApplicationController
  before_action :load_motel, only: [:show]

  def show
  end



  private

  def load_motel
    @motel = Motel.all.select { |motel| motel.id == params[:id] }
  end


end
