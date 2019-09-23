require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
      first_name: "test",
      last_name: "testing",
      email: "test@test.com",
      password: "test",
      password_confirmation: "test"
    )
  }

  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid with a duplicate email" do
      @user1 = User.create(
        first_name: "test",
        last_name: "testing",
        email: "testing@test.com",
        password: "test",
        password_confirmation: "test"
      )
      @user2 = User.create(
        first_name: "test",
        last_name: "testing",
        email: "testing@test.com",
        password: "test",
        password_confirmation: "test"
      )
      expect(@user2).to_not be_valid
    end

    it "is not valid with non matching passwords" do
      subject.password = "testing"
      expect(subject).to_not be_valid
    end

    it "is not valid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid when password is too short" do
      subject.password = "tt"
      expect(subject).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    it "returns an user for a valid login" do
      @user = User.create(
        first_name: "test",
        last_name: "testing",
        email: "pw@test.com",
        password: "test",
        password_confirmation: "test"
      )
      email = "pw@test.com"
      password = "test"
      user = User.authenticate_with_credentials(email, password)
      expect(user).to_not be_nil
    end

    it "returns nil for an invalid login" do
      @user = User.create(
        first_name: "test",
        last_name: "testing",
        email: "pw2@test.com",
        password: "test",
        password_confirmation: "test"
      )
      email = "pw2@test.com"
      password = "testing"
      user = User.authenticate_with_credentials(email, password)
      expect(user).to be_nil
    end

    it "returns an user for a valid login" do
      @user = User.create(
        first_name: "test",
        last_name: "testing",
        email: "pw@test.com",
        password: "test",
        password_confirmation: "test"
      )
      email = "  pw@test.com  "
      password = "test"
      user = User.authenticate_with_credentials(email, password)
      expect(user).to_not be_nil
    end

  end

end
