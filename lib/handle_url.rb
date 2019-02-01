# frozen_string_literal: true

require 'pg'

# Class comment...
class HandleUrl
  def self.set_db
    @db = 'bookmark_manager'
    @db = 'bookmark_manager_test' if ENV['ENVIRONMENT'] == 'test'
    @connection = PG.connect(dbname: @db)
  end

  def self.add_url(url, title)
    set_db
    @connection.exec("INSERT INTO bookmarks (url, title)
    VALUES ('#{url}', '#{title}');")
  end

  def self.delete_url(id)
    set_db
    @connection.exec("DELETE FROM bookmarks WHERE id = #{id};")
  end

  def self.update_url(id, url, title)
    set_db
    @connection.exec("UPDATE bookmarks SET url = '#{url}', title = '#{title}'
      WHERE id = #{id};")
  end
end
