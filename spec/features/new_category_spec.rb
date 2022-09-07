require 'rails_helper'

RSpec.feature 'NewCategories', type: :feature do
  before :each do
    @user = User.create(email: 'newCategory@email.com', password: 'password', name: 'New Category User')
    @user.confirm
  end

  scenario 'User visits the new category page and sees a form to create a new category' do
    sign_in @user
    visit new_category_path
    expect(page).to have_content('NEW CATEGORY')
    expect(page).to have_selector('#new_category_form')
  end

  scenario 'The user fills out a form to create a new category, indicating their name and icon (both mandatory).' do
    sign_in @user
    visit new_category_path
    fill_in 'Name', with: 'Test Category'
    fill_in 'Icon', with: 'category.png'
    click_button 'Create Category'
    expect(page).to have_content('Category was successfully created.')
    expect(page).to have_content('Test Category')
    expect(page).to have_content('CATEGORIES')
    expect(@user.groups.count).to eq(1)
  end

  scenario 'When the user clicks on the "Back" button (<), the user navigates to the home page.' do
    sign_in @user
    visit new_category_path
    click_link '<'
    expect(page).to have_content('CATEGORIES')
  end

  scenario 'user visits a new categy page without authenticate and is presented with the login page' do
    visit new_category_path
    expect(page).to have_content('LOG IN')
  end
end
