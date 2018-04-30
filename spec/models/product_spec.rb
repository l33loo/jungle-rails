require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "saves new instances of Product when all fields are set" do
      prod1 = Product.create(name: 'Book', price: 999, quantity: 5, category_id: 1)

      expect(prod1).to be_new_record
    end

    it "fails validation with no name, expecting a specific error message" do
      prod = Product.create(name: nil, price: 1000, quantity: 2, category_id: 2)

      expect(prod.errors.full_messages).to include("Name can't be blank")
    end

  end
end
