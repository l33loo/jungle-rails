require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'PasswordValidations' do

    it 'validates that a new user is created with a password and a password confirmation' do
      user = User.create(first_name: 'Leelee', last_name: 'Sudoku', email: 'leelee@leelee.com')

      expect(user).not_to be_valid
    end

    it 'validates that password and a password confirmation have the same value' do
      user = User.create(first_name: 'Leelee', last_name: 'Sudoku', email: 'leelee@leelee.com', password: '123456', password_confirmation: '234567')

      expect(new_user_password_confirmation_match?(user)).to be false
    end
  end

  describe 'EmailValidations' do
    it 'validates that the email is unique with identical case' do
      user1 = User.create(first_name: 'Leelee', last_name: 'Sudoku', email: 'leelee@leelee.com', password: '123456', password_confirmation: '123456')
      user2 = User.create(first_name: 'bob', last_name: 'Sudo', email: 'leelee@leelee.com', password: '234567', password_confirmation: '234567')

      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'validates that the email is unique regardless of different case' do
      user1 = User.create(first_name: 'Leelee', last_name: 'Sudoku', email: 'leelee@leelee.COM', password: '123456', password_confirmation: '123456')
      user2 = User.create(first_name: 'bob', last_name: 'Sudo', email: 'LEELEE@LEELEE.com', password: '234567', password_confirmation: '234567')

      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

  end

  private

  def new_user_password_confirmation_match?(user)
    user.password == user.password_confirmation
  end

end


# validates :first_name, presence: true
#   validates :last_name, presence: true
#   validates :email, presence: true, uniqueness: { case_sensitive: false }
#   validates :password, presence: true
#   validates :password_confirmation, presence: true

