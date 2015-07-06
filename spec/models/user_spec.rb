require 'rails_helper'

describe User do
  it 'creates a new user' do
    user = User.create(username: 'billy')
    binding.pry
    expect(user.username).to eql('billy')
  end
  it { should validate_presence_of :password }



end
