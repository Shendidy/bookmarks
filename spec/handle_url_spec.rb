# frozen_string_literal: true

require 'handle_url'
require 'bookmark'

describe '.delete' do
  it 'deletes the given bookmark' do
    HandleUrl.add_url('http://www.test.com', 'Testing site')
    expect(Bookmark.all.length).to eq 1

    HandleUrl.delete_url(Bookmark.all.first['id'])

    expect(Bookmark.all.length).to eq 0
  end
end
