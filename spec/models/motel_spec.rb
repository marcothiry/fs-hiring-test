require 'rails_helper'

RSpec.describe Motel, type: :model do
  context "testing Model responsiveness to API" do

    it "There should be 3 existing Motels" do
      expect(Motel.all.count).to eql(3)
    end

  end


end
