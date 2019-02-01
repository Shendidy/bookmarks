# frozen_string_literal: true

require 'PG'

# class comment...
class Bookmark
  attr_accessor :db

  @db = 'bookmark_manager'
  def self.all
    bookmarks_list = []

    @db = 'bookmark_manager_test' if ENV['ENVIRONMENT'] == 'test'

    connection = PG.connect(dbname: @db)
    result = connection.exec('SELECT id, url, title FROM bookmarks ORDER BY id')
    result.each do |bookmark|
      bookmarks_list << { 'id' => bookmark['id'], 'url' =>
        bookmark['url'], 'title' => bookmark['title'] }
    end

    bookmarks_list
  end
end
