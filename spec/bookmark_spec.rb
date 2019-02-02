# frozen_string_literal: true

require 'bookmark.rb'

describe '.all' do
  it 'returns a list of bookmarks' do
    DatabaseConnection.setup('bookmark_manager_test')

    # Add the test data
    DatabaseConnection.query("INSERT INTO bookmarks (url, title)
    VALUES ('http://www.makersacademy.com', 'Makers Academy');")
    DatabaseConnection.query("INSERT INTO bookmarks (url, title)
    VALUES('http://www.destroyallsoftware.com', 'Destroy all software');")
    DatabaseConnection.query("INSERT INTO bookmarks (url, title)
    VALUES('http://www.google.com', 'British google');")

    bookmarks = Bookmark.all

    expect(bookmarks[0].value?('http://www.makersacademy.com')).to eq true
    expect(bookmarks[1].value?('http://www.destroyallsoftware.com')).to eq true
    expect(bookmarks[2].value?('British google')).to eq true
  end

  it 'checks the ENVIRONMENT variable value' do
    expect(ENV['ENVIRONMENT']).to eq 'test'
  end
end
