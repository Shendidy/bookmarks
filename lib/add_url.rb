# frozen_string_literal: true

require 'pg'

# Class comment...
class AddUrl
  @db = 'bookmark_manager'

  def self.add_url(url)
    @db = 'bookmark_manager_test' if ENV['ENVIRONMENT'] == 'test'

    connection = PG.connect(dbname: @db)
    connection.exec("INSERT INTO bookmarks (url)
    VALUES ('#{url}');")
  end
end
