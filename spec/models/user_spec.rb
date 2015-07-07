require 'rails_helper'

describe User do
  it { should validate_presence_of :username }
  it { should validate_presence_of :password }

  it 'creates a new user' do
    user = User.create(username: 'billy')
    expect(user.username).to eql('billy')
    expect(user.save).to eql(false)
  end

  it "authenticates a user" do
    user = User.create(username: 'billy', password: 'test')
    expect(User.authenticate(user.username, user.password)).to eql(user)
  end

  it "returns true if admin" do
    user = User.create(username: 'billy', password: 'test', admin: true)
    expect(User.find(user.id).admin?).to eql(true)
  end

  it "returns false if not admin" do
    user = User.create(username: 'billy', password: 'test')
    expect(User.find(user.id).admin?).to eql(false || nil)
  end
end
