class User < ApplicationRecord
  validates :username, :email, presence: true
  validates_length_of :username, minimum: 3, maximum: 10
  validates_uniqueness_of :username, :email

  has_many :events
  #has_many :created_events, class_name: 'Event', foreign_key: :creator_id
  has_many :invitations, foreign_key: :attendee_id
  has_many :attended_events, through: :invitations
end
