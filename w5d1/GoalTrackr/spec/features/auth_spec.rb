# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      visit new_user_url
      fill_in 'Username', :with => "Mr User"
      fill_in 'Password', :with => "passwordstrong"
      click_on "Sign Up"
      expect(page).to have_content "Mr User"
    end

  end

end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    visit new_session_url
    fill_in 'Username', :with => "Mr User"
    fill_in 'Password', :with => "passwordstrong"
    click_on 'Sign In'
    expect(page).to have_content "Mr User"
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit root_url
    expect(page).to have_content "Sign In"
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    visit new_session_url
    fill_in 'Username', :with => "Mr User"
    fill_in 'Password', :with => "passwordstrong"
    click_on 'Sign In'
    click_on 'Sign Out'
    expect(page).to_not have_content "Mr User"
  end

end
