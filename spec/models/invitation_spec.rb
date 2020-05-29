require 'rails_helper.rb'

describe Invitation, type: :model do
  describe 'New Invitation' do
    subject(:invitation) { Invitation.new }

    it 'returns an invitation class object' do
      expect(invitation).to be_a_new(Invitation)
    end

    it 'creates new valid invitation with attendee id and event_id' do
      u = User.create(username: 'name', email: 'another@someserver.com')
      e = Event.create(user_id: u.id, name: 'Party', event_date: Time.now + 10.days, location: 'web')
      i = e.invitations.new(attendee_id: u.id, attended_event_id: e.id)
      expect(i.valid?).to be(true)
    end

    it 'fails to create invitation without attendee id ' do
      u = User.create(username: 'name', email: 'another@someserver.com')
      e = Event.create(user_id: u.id, name: 'Party', event_date: Time.now + 10.days, location: 'web')
      i = e.invitations.new(attended_event_id: e.id)
      expect(i.valid?).to be(false)
    end

    it 'fails to create invitation without attended_event id ' do
      u = User.create(username: 'name', email: 'another@someserver.com')
      i = u.invitations.new(attendee_id: u.id)
      puts i
      expect(i.valid?).to be(false)
    end
  end
end
