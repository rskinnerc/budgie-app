require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.create(email: 'groups@email.com', password: 'password', name: 'Groups User')
  end

  it 'should be valid onlty with an icon and name attributes' do
    group = Group.new(user: @user)
    expect(group).to_not be_valid
  end

  it 'should belong to a user' do
    group = Group.new
    expect(group).to respond_to(:user)
  end

  it 'should have many operations' do
    group = Group.new
    expect(group).to respond_to(:operations)
  end

  it 'should have a total method' do
    group = Group.new
    expect(group).to respond_to(:total)
  end

  # TODO: Implement total for all transactions in this category
end
