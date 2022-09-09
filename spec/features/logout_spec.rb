require 'rails_helper'

RSpec.feature 'Logouts', type: :feature do
  scenario 'User logs out' do
    user = User.create(email: 'logout@test.com', password: 'password', name: 'Logout')
    user.confirm
    sign_in user
    visit root_path
    click_on 'logout'
    expect(page).to have_content('Signed out successfully.')
    expect(page).to have_current_path(welcome_path)
  end
end
