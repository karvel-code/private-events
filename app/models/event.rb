# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations
  has_many :attendees, through: :invitations, source: :user

  scope :past_events, -> { where('date < ?', Date.current) }
  scope :upcoming_events, -> { where('date >= ?', Date.current) }
end
