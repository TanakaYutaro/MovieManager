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

  describe "when name is too long" do
    before do
      @user.name = "a" * 51
    end
    it "shoud not be valid" do
      expect(@user).not_to be_valid
    end
  end

  describe "when email format is invalid" do
    it "shoud be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "shoud be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it "shoud not be valid" do
      expect(@user).not_to be_valid
    end
  end
end