# frozen_string_literal: true

require_relative '../spec_helper.rb'

feature 'bookmarks' do
  scenario 'see my bookmarks list page' do
    visit('/')
    click_button 'Manage your bookmarks list'

    expect(page).to have_content('My Bookmarks:')
  end
end
