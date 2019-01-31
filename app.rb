# frozen_string_literal: true

require 'sinatra/base'
require_relative 'lib/bookmark'
require_relative 'lib/add_url'

# class comment...
class BookMarkManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/add_page' do
    erb :'/bookmarks/add'
  end

  post '/add_urls' do
    @url = params[:new_url]
    $url = @url
    puts
    puts "from app.rb"
    puts params[:new_url]

    redirect '/add_url'
  end

  get '/add_url' do
    @url = $url
    puts
    puts "from app.rb add_urls get"
    puts @url

    AddUrl.add_url(@url)

    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'/bookmarks/index'
  end

  run! if app_file == $PROGRAM_NAME
end
