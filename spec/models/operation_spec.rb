require 'rails_helper'

RSpec.describe Operation, type: :model do
  it 'should have a name and amount' do
    operation = Operation.new
    expect(operation).to_not be_valid
  end

  it 'should belong to a user' do
    operation = Operation.new(name: 'Test Operation', amount: 100)
    expect(operation).to_not be_valid
  end

  it 'should be vaid with a name, amount and a valid user' do
    user = User.create(email: 'operationuser@email.com', password: 'password', name: 'Operation User')
    operation = Operation.new(name: 'Test Operation', amount: 100, user:)
    expect(operation).to be_valid
  end

  it 'should belong to a user' do
    operation = Operation.new
    expect(operation).to respond_to(:user)
  end

  it 'should have many groups' do
    user = User.create(email: 'operationuser@email.com', password: 'password', name: 'Operation User')
    operation = Operation.new(name: 'Test Operation', amount: 100, user:)
    expect(operation).to respond_to(:groups)
  end
end
