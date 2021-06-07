require 'rails_helper'
require 'capybara/rails'
RSpec.describe User, type: :model do
    context 'validation test' do
      it 'ensures email presence' do
        user = User.new(email: 'elvis@gmail.com').save
        expect(user).to eq(false)
      end

      it 'should have a vaild email' do
        user = User.new( password: 'elvis123').save
        expect(user).to eq(false)
      end

      it 'should save the user successfully' do
        user = User.new( email: 'elvis@example.com', password: 'password123').save
        expect(user).to eq(true)
      end
    end
end
