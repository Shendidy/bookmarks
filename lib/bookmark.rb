require 'PG'

class Bookmark

  attr_accessor :db

  @db = 'bookmark_manager'
  def self.all
    bookmarks_list = []

    if ENV['ENVIRONMENT'] == 'test'
      @db = 'bookmark_manager_test'
    else
      @db = 'bookmark_manager'
    end

    connection = PG.connect(dbname: @db)
    result = connection.exec('SELECT url FROM bookmarks ORDER BY url')
    result.each { |bookmark| bookmarks_list << bookmark['url'] }

    bookmarks_list
  end
end
