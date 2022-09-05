require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid containing a name attribute' do
    user = User.new(name: 'Test User')
    expect(user).to be_valid
  end

  it 'is invalid without a name attribute' do
    user = User.new
    expect(user).to_not be_valid
  end

  it 'should have many operations' do
    user = User.new(name: 'Test User')
    expect(user).to respond_to(:operations)
  end

  it 'should have many groups' do
    user = User.new(name: 'Test User')
    expect(user).to respond_to(:groups)
  end
end
