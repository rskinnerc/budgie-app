require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  before :each do
    @user = User.create(email: 'groups@email.com', password: 'password', name: 'Groups User')
    Group.create(name: 'Test Category', icon: 'category.png', user: @user)
    Group.create(name: 'Test Category 2', icon: 'category2.png', user: @user)
    @user.confirm
  end

  scenario 'User logs in and is presented with the categories page' do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content('CATEGORIES')
  end

  scenario 'User visits the home page and sees a list of categories with icon, name and total of all operations' do
    sign_in @user
    visit root_path
    expect(page).to have_content('CATEGORIES')
    expect(page).to have_content('Text Category')
    expect(page).to have_content('Text Category 2')
    expect(page).to have_selector('img[src*="category.png"]')
    expect(page).to have_selector('img[src*="category2.png"]')
    expect(page).to have_content('$0.00')
  end

  scenario 'User clicks on a category and is presented with the operations page for that category' do
    sign_in @user
    visit root_path
    click_link 'Test Category'
    expect(page).to have_content('OPERATIONS')
  end

  scenario 'User clicks on a "Add a new category" link and is presented with new category page' do
    sign_in @user
    visit root_path
    click_link 'Add a new category'
    expect(page).to have_content('NEW CATEGORY')
    expect(page).to have_selector('#new_category_form')
  end

  scenario 'User visits categories page without logging in and is presented with the login page' do
    visit root_path
    expect(page).to have_content('Log in')
  end
end
