# frozen_string_literal: true

require_relative '../spec_helper.rb'

feature 'bookmarks' do
  scenario 'Add button will take me to adding page' do
    visit('/')
    click_button 'Manage your bookmarks list'
    click_button 'Add a url'

    expect(page).to have_content('Insert url:')
  end

  scenario 'Adding a url will be added to the database
    and shown in the bookmarks list' do
    visit('/')
    click_button 'Manage your bookmarks list'
    click_button 'Add a url'
    fill_in 'new_url', with: 'http://www.masrawy.2com'
    fill_in 'title', with: 'Egypt news'
    click_button 'Add'

    expect(page).to have_content('Egypt')
  end
end
