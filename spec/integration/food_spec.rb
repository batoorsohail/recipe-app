require 'rails_helper'

RSpec.describe 'foods/index', type: :feature do
  describe 'after log in' do
    before(:each) do
      @user1 = User.create(name: 'Rac', email: 'rac@gmail.com', password: 'Rac1234', confirmed_at: Time.now)
      @food1 = Food.create(name: 'Beans', measurement_unit: 'grams', price: 10, quantity: 2, user_id: @user1.id)
      @food2 = Food.create(name: 'Pizza', measurement_unit: 'slices', price: 20, quantity: 5, user_id: @user1.id)

      visit 'users/sign_in'
    end

    it 'displays Foods list in navbar' do
      fill_in 'user_email', with: 'rac@gmail.com'
      fill_in 'user_password', with: 'Rac1234'
      click_on 'Log in'

      visit 'foods'
      expect(page).to have_content 'Food Items'
    end

    it 'displays a list of the foods' do
      fill_in 'user_email', with: 'rac@gmail.com'
      fill_in 'user_password', with: 'Rac1234'
      click_on 'Log in'

      visit 'foods'
      expect(page).to have_content 'Beans'
      expect(page).to have_content 'Pizza'
    end

    it 'has a button to add new food' do
      fill_in 'user_email', with: 'rac@gmail.com'
      fill_in 'user_password', with: 'Rac1234'
      click_on 'Log in'

      visit 'foods'
      expect(page).to have_content 'Add ingredient'
    end
  end
end
