require 'rails_helper'

RSpec.feature 'Signups', type: :feature do
  scenario 'User visits the signup page and signs up' do
    visit new_user_registration_path
    expect(page).to have_selector('#signup-form')

    fill_in 'Email', with: 'test_sign_up@email.com'
    fill_in 'Name', with: 'Test User'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content('A message with a confirmation link has been sent to your email address.')
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'User visits the signup page when already authenticated and gets redirected to the home page' do
    user = User.create(email: 'test_sign_up2@email.com', name: 'Test User', password: 'password')
    user.confirm
    sign_in user
    visit new_user_registration_path
    expect(page).to_not have_selector('#signup-form')
    expect(page).to have_content('CATEGORIES')
    expect(page).to have_content('You are already signed in.')
  end
end
