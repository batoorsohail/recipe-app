require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'creation' do
    before :all do
      @user = User.create(name: 'Test', email: 'test@gmail.com')
      @food = Food.create(name: 'Food', measurement_unit: 'Kg', price: 10, quantity: 442, user_id: @user.id)
    end

    it 'has a name' do
      expect(@food.name).to eq('Food')
    end

    it 'has a measurement unit' do
      expect(@food.measurement_unit).to eq('Kg')
    end

    it 'has a price' do
      expect(@food.price).to eq(10)
    end

    it 'has quantity' do
      expect(@food.quantity).to eq(442)
    end

    it 'belongs to a user' do
      expect(@food.user_id).to eq(@user.id)
    end
  end
end
