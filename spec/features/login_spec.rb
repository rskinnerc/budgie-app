require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  before :each do
    @user = User.create(email: 'login@email.com', password: 'password', name: 'Login User')
    @user.confirm
  end

  scenario 'User logs in with valid credentials' do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'User logs in with invalid credentials' do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'User visits when already logged in' do
    sign_in @user
    visit new_user_session_path
    expect(page).to have_content('You are already signed in.')
    expect(page).to have_content('CATEGORIES')
  end

  scenario 'User logs in with a non-confimed email' do
    @user.update(confirmed_at: nil)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    expect(page).to have_content('You have to confirm your email address before continuing.')
    expect(page).to have_content('Log in')
  end
end
