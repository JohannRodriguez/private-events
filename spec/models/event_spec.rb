require 'rails_helper.rb'

describe Event, type: :model do
  before :each do
  end

  describe 'New Event' do
    subject(:event) { Event.new }

    it 'returns an Event class object' do
      expect(event).to be_a_new(Event)
    end

    it 'fails to create event if lacks creator' do
      e = Event.new(name: 'Party', event_date: Time.now)
      expect(e.persisted?).to eql(false)
    end

    it 'fails to create event if lacks name' do
      e = Event.new(creator_id: 1, event_date: Time.now)
      expect(e.persisted?).to eql(false)
    end

    it 'fails to create event if lacks date' do
      e = Event.new(creator_id: 1, name: 'Party')
      expect(e.persisted?).to eql(false)
    end
  end
end
