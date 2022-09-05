require 'rails_helper'

RSpec.feature 'SplashScreens', type: :feature do
  scenario 'User visits the welcome page' do
    visit welcome_path
    expect(page).to have_selector('#logo')
    expect(page).to have_selector('#login-link')
    expect(page).to have_selector('#signup-link')
  end

  scenario 'User visits the welcome page and navigate to the login page' do
    visit welcome_path
    click_link 'LOG IN'
    expect(page).to have_content('Log in')
    expect(page).to have_selector('#login-form')
  end

  scenario 'User visits the welcome page and navigate to the signup page' do
    visit welcome_path
    click_link 'SIGN UP'
    expect(page).to have_content('Sign up')
    expect(page).to have_selector('#signup-form')
  end
end
