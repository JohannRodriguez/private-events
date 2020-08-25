require 'rails_helper.rb'
require 'spec_helper.rb'

describe 'user new_view ' do
  context 'create new user' do
    it 'should succeed creating new user' do
      visit '/users/new'
      fill_in 'user[username]', with: 'user1'
      fill_in 'user[email]', with: 'user1@testing.com'
      click_button 'Create'
      expect(page).to have_content 'Log In'
    end
  end
end

describe 'user show view' do
  before :each do
    User.create(username: 'name', email: 'some@someserver.com')
  end

  it 'shows the user name' do
    visit '/sign_in'
    fill_in 'username', with: 'name'
    click_button 'Login'
    visit user_path(1)
    expect(page).to have_content 'name'
  end
end
