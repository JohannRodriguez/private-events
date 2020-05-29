require 'rails_helper.rb'
describe User, type: :model do
  before :each do
    User.create(username: 'name', email: 'some@someserver.com')
  end

  describe 'New User' do
    subject(:user) { User.new }

    it 'returns an user class object' do
      expect(user).to be_a_new(User)
    end

    it 'fails to create a user without name' do
      u = User.new(email: 'any@gamil.com')
      expect(u.persisted?).to eql(false)
    end

    it 'fails to create a user without email' do
      u = User.new(username: 'any name')
      expect(u.persisted?).to eql(false)
    end

    it 'fails to create a user with not unique email' do
      u = User.new(username: 'any', email: 'some@someserver.com')
      expect(u.persisted?).to eql(false)
    end

    it 'fails to create a user with not unique email' do
      u = User.new(username: 'name', email: 'another@someserver.com')
      expect(u.persisted?).to eql(false)
    end
  end
end
