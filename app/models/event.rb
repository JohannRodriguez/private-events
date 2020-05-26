class Event < ApplicationRecord
  belongs_to :user

  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations
  def self.upcoming
    list=[]
    Event.all.each do |i|
      list.push i if i.event_date > Time.now
    end
    return list
  end
  
  def self.previous
    list=[]
    Event.all.each do |i|
      list.push i if i.event_date <= Time.now
    end
    return list
  end
end
