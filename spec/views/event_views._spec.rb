require 'rails_helper.rb'
require 'spec_helper.rb'

describe 'event new_view ' do
  context 'create new event' do
    before :each do
      User.create(username: 'name', email: 'some@someserver.com')
    end

    it 'should succeed creating new event' do
      visit '/sign_in'
      fill_in 'username', with: 'name'
      click_button 'Login'
      visit '/events/new'
      fill_in 'name', with: 'test-event'
      fill_in 'event_date', with: '2020-05-05'
      fill_in 'location', with: 'testing-location'
      click_button 'Create'
      expect(page).to have_content 'Your Events:'
    end
  end
end
