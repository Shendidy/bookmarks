# frozen_string_literal: true

require 'sinatra/base'
require_relative 'lib/bookmark'
require_relative 'lib/add_url'
require_relative 'lib/url'

# class comment...
class BookMarkManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/add_page' do
    erb :'/bookmarks/add'
  end

  post '/add_urls' do
    @url = Url.create(params[:new_url])

    redirect '/add_url'
  end

  get '/add_url' do
    @url = Url.instance
    AddUrl.add_url(@url.address)

    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'/bookmarks/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
