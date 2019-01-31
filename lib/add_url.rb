require 'pg'

class AddUrl

  @db = 'bookmark_manager'

  def self.add_url(url)
    puts 'sherif3'
    puts url

    @db = 'bookmark_manager_test' if ENV['ENVIRONMENT'] == 'test'

    connection = PG.connect(dbname: @db)
    connection.exec("INSERT INTO bookmarks (url)
    VALUES ('#{url}');")
  end
end
