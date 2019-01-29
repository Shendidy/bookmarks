require_relative '../spec_helper.rb'

feature 'Index' do
  scenario 'see my bookmarks page' do
    visit('/')
    expect(page).to have_content("My Bookmarks")
  end
  scenario 'see my bookmarks' do
    visit('/bookmarks/index')
    expect(page).to have_content("tumblr.com")
  end
end
