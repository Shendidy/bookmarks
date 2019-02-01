# frozen_string_literal: true

require 'pg'

# Class comment...
class HandleUrl

  def self.set_db
    @db = (ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' :
       'bookmark_manager')
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
end
