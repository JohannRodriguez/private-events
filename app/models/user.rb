class User < ApplicationRecord
  has_many :events
  has_many :invitations, foreign_key: :attendee_id
  has_many :attended_events, through: :invitations
end
