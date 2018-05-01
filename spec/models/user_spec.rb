require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'EmailValidations' do

    it 'validates that a new user is created with a password and a password confirmation' do
      user = User.create(first_name: 'Leelee', last_name: 'Sudoku', email: 'leelee@leelee.com')
      expect(user).not_to be_valid
    end
  end

end


# validates :first_name, presence: true
#   validates :last_name, presence: true
#   validates :email, presence: true, uniqueness: { case_sensitive: false }
#   validates :password, presence: true
#   validates :password_confirmation, presence: true
