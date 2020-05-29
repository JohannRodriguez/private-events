class Event < ApplicationRecord
  validates :name, :location, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations

  scope :upcoming, -> { where('event_date > ?', Time.now.to_date) }
  scope :previous, -> { where('event_date < ?', Time.now.to_date) }
end
