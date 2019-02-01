# frozen_string_literal: true

feature 'Deleting a bookmark' do
  scenario 'A user can update a bookmark' do
    bookmark = Url.create('http://www.makersacademy.com', 'Makers Academy')
    HandleUrl.add_url(bookmark.address, bookmark.title)
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy',
                              href: 'http://www.makersacademy.com')
    expect(page).to have_button 'Update'

    first('.bookmark').click_button 'Update'

    expect(current_path).to have_content 'update_bookmark'

    expect(page).to have_content 'Update your bookmark'

    fill_in 'new_title', with: 'Revised title'

    click_button 'Update'

    expect(current_path).to have_content 'bookmarks'
    expect(page).to have_content 'Revised'

    visit('/bookmarks')
    expect(page).to have_link('Revised title',
                              href: 'http://www.makersacademy.com')
  end
end
