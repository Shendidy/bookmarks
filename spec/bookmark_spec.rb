# frozen_string_literal: true

require 'bookmark.rb'

describe '.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url, title)
    VALUES ('http://www.makersacademy.com', 'Makers Academy');")
    connection.exec("INSERT INTO bookmarks (url, title)
    VALUES('http://www.destroyallsoftware.com', 'Destroy all software');")
    connection.exec("INSERT INTO bookmarks (url, title)
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
