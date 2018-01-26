require 'rails_helper'

RSpec.describe User, type: :model do

  it "should store user in the database upon creation" do
    user = User.create(email: "rspec@test.com", password: "123456")
    expect(User.last).to eql(user)
  end

  it "should not be able to create a user with a passward  < 6 characters" do
    user = User.create(email: "rspec@test.com", password: "12345")
    (User.last).should_not eql(user)
  end
end

