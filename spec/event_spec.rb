require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Event, type: :model do
  context 'validation tests' do
    it 'should have a valid title' do
      event = Event.new(description: 'description', date: Date.today).save
      expect(event).to eq(false)
    end

    it 'should have a valid description' do
      event = Event.new(title: 'title', date: Date.today).save
      expect(event).to eq(false)
    end

    it 'should have a valid date' do
      event = Event.new(title: 'title', description: 'description').save
      expect(event).to eq(false)
    end
  end
end
