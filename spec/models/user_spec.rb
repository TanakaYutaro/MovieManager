require 'spec_helper'
require 'rails_helper'

describe "User" do
  before do
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  subject do
    @user
  end

  it "should respond to 'name'" do
    expect(@user).to respond_to(:name)
  end

  it "should respond to 'email'" do
    expect(@user).to respond_to(:email)
  end

  describe "when name is not present" do
    before do
      @user.name = ""
    end
    it "shoud not be valid" do
      expect(@user).not_to be_valid
    end
  end

  describe "when email is not present" do
    before do
      @user.email = ""
    end
    it "shoud not be valid" do
      expect(@user).not_to be_valid
    end
  end
end