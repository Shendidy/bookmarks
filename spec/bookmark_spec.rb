# frozen_string_literal: true

require 'bookmark.rb'

describe '.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url)
    VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url)
    VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url)
    VALUES('http://www.google.com');")

    bookmarks = Bookmark.all

    expect(bookmarks).to include('http://www.makersacademy.com')
    expect(bookmarks).to include('http://www.destroyallsoftware.com')
    expect(bookmarks).to include('http://www.google.com')
  end

  it 'checks the ENVIRONMENT variable value' do
    expect(ENV['ENVIRONMENT']).to eq 'test'
  end
end
