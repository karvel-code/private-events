class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  belongs_to :creator, class_name: 'User'
  has_many :invitations
  has_many :attendees, through: :invitations, source: :user

  scope :past_events, -> { where('date < ?', Date.current) }
  scope :upcoming_events, -> { where('date >= ?', Date.current) }
end
