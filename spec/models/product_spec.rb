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

    it "fails validation with no price, expecting a specific error message" do
      prod = Product.create(name: "Lala", price: nil, quantity: 3, category_id: 3)

      expect(prod.errors.full_messages).to include("Price can't be blank")
    end

    it "fails validation with no quantity, expecting a specific error message" do
      prod = Product.create(name: "Foo", price: 1200, quantity: nil, category_id: 1)
    end

    it "fails validation with no category, expecting a specific error message" do
      prod = Product.create(name: "Joe", price: 1400, quantity: 12, category_id: nil)
    end
  end
end
