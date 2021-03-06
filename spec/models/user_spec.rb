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

    it 'validates that password must have a minimum length when account is created' do
      user = User.create(first_name: 'Leelee', last_name: 'Sudoku', email: 'leelee@leelee.com', password: '12345', password_confirmation: '12345')

      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
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

    it 'validates that the email is required' do
      user = User.create(first_name: 'Leelee', last_name: 'Sudoku', password: '123456', password_confirmation: '123456')

      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end

  describe 'NameValidations' do
    it 'validates that the first name is required' do
      user = User.create(last_name: 'Sudoku', email: 'leelee@leelee.COM', password: '123456', password_confirmation: '123456')

      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'validates that a last name is required' do
      user = User.create(first_name: 'Leelee', email: 'leelee@leelee.com', password: '123456', password_confirmation: '123456')

      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do

    before :each do
      User.create!(first_name: 'Leelee', last_name: 'Sudoku', email: 'leelee@leelee.com', password: '123456', password_confirmation: '123456')
    end

    it 'validates that email gets authenticated' do
      expect(User.authenticate_with_credentials('lee@lee.com', '123456')).to eq nil
    end

    it 'validates that password gets authenticated' do
      expect(User.authenticate_with_credentials('leelee@leelee.com', '234567')).to eq nil
    end

    it 'validates that email gets authenticated despite extra whitespace' do
      expect(User.authenticate_with_credentials(' leelee@leelee.com', '123456')).not_to eq nil
    end

    it 'validates that email gets authenticated irrespective of case' do
      expect(User.authenticate_with_credentials('LEElee@leELee.com', '123456')).not_to eq nil
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

