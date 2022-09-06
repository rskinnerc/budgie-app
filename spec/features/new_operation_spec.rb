require 'rails_helper'

RSpec.feature 'NewOperations', type: :feature do
  before :each do
    @user = User.create(email: 'newOperation@email.com', password: 'password', name: 'New Operation User')
    @user.confirm
    @category = Group.create(name: 'Test Category', icon: 'category.png', user: @user)
    @category2 = Group.create(name: 'Test Category 2', icon: 'category2.png', user: @user)
  end

  scenario 'User visits the new operation page and sees a form to create a new operation' do
    sign_in @user
    visit new_category_operation_path(@category)
    expect(page).to have_content('NEW OPERATION')
    expect(page).to have_selector('#new_operation_form')
  end

  scenario 'User fills out a form to create a new operation with name, amount and a default category (mandatory).' do
    sign_in @user
    visit new_category_operation_path(@category)
    expect(page).to have_selector("input[name=\"categories[#{@category.id}]\"]")
    expect(page).to have_selector("input[name=\"categories[#{@category2.id}]\"]")
    fill_in 'Name', with: 'Test Operation'
    fill_in 'Amount', with: 100
    click_button 'Create Operation'
    expect(page).to have_content('Operation was successfully created.')
    expect(page).to have_content('Test Operation')
    expect(page).to have_content('OPERATIONS')
    expect(@category.operations.count).to eq(1)
  end

  scenario 'User fills out a form to create a new operation with name, amount and a second category (mandatory).' do
    sign_in @user
    visit new_category_operation_path(@category)
    expect(page).to have_selector("input[name=\"categories[#{@category.id}]\"]")
    expect(page).to have_selector("input[name=\"categories[#{@category2.id}]\"]")
    check "categories[#{@category2.id}]"
    fill_in 'Name', with: 'Test Operation'
    fill_in 'Amount', with: 100
    click_button 'Create Operation'
    expect(page).to have_content('Operation was successfully created.')
    expect(page).to have_content('Test Operation')
    expect(page).to have_content('OPERATIONS')
    expect(@category.operations.count).to eq(1)
  end

  scenario 'When the user clicks on the "Back" button (<), the user navigates to the category page.' do
    sign_in @user
    visit new_category_operation_path(@category)
    click_link '<'
    expect(page).to have_content('Test Category')
    expect(page).to have_content('OPERATIONS')
  end

  scenario 'user visits a new operation page without authenticate and is presented with the login page' do
    visit new_category_operation_path(@category)
    expect(page).to have_content('Log in')
  end
end
