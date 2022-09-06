require 'rails_helper'

RSpec.feature 'Operations', type: :feature do
  before :each do
    @user = User.create(email: 'operations@email.com', password: 'password', name: 'Operations User')
    @user.confirm
    @category = Group.create(name: 'Test Category', icon: 'category.png', user: @user)
    @operation = Operation.create(amount: 100, name: 'Test Operation', group: @category, user: @user)
    @operation2 = Operation.create(amount: 200, name: 'Test Operation 2', group: @category, user: @user)
  end

  scenario 'User visits a given category, the list of operations is presented, ordered by the most recent.' do
    sign_in @user
    visit category_path(@category)
    expect(page).to have_content('Test Operation 2')
    expect(page).to have_content('Test Operation')
  end

  scenario 'user visits a given category and could see the total amount for the category' do
    sign_in @user
    visit category_path(@category)
    expect(page).to have_content('$300.00')
  end

  scenario 'a button "add a new operation" that brings the user to the page to create a new operation' do
    sign_in @user
    visit category_path(@category)
    click_link 'Add a new operation'
    expect(page).to have_content('NEW OPERATION')
    expect(page).to have_selector('#new_operation_form')
  end

  scenario 'user clicks on the "Back" button (<), the user navigates to the home page.' do
    sign_in @user
    visit category_path(@category)
    click_link '<'
    expect(page).to have_content('CATEGORIES')
  end

  scenario 'user visits a given category without authenticate and is presented with the login page' do
    visit category_path(@category)
    expect(page).to have_content('Log in')
  end
end
