# frozen_string_literal: true

require_relative './database_connection.rb'

# class comment...
class Bookmark
  attr_accessor :db

  def self.all
    # set_db
    bookmarks_list = []

    # connection = PG.connect(dbname: @db)
    result = DatabaseConnection.query('SELECT id, url, title FROM
      bookmarks ORDER BY id')
    result.each do |bookmark|
      bookmarks_list << { 'id' => bookmark['id'], 'url' =>
        bookmark['url'], 'title' => bookmark['title'] }
    end

    bookmarks_list
  end
  #
  # def self.set_db
  #   return @db = 'bookmark_manager_test' if ENV['ENVIRONMENT'] == 'test'
  #
  #   @db = 'bookmark_manager'
  # end
end
