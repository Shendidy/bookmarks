# frozen_string_literal: true

require_relative '../spec_helper.rb'

feature 'Index' do
  scenario 'see my bookmarks page' do
    visit('/')

    expect(page).to have_content('My Bookmarks')
  end
end
