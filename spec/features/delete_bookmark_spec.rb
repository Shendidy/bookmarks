feature 'Deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    bookmark = Url.create('http://www.makersacademy.com', 'Makers Academy')
    HandleUrl.add_url(bookmark.address, bookmark.title)
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to have_content'/bookmarks'
    visit('/bookmarks')
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end
