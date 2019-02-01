# frozen_string_literal: true

require 'sinatra/base'
require_relative 'lib/bookmark'
require_relative 'lib/handle_url'
require_relative 'lib/url'

# class comment...
class BookMarkManager < Sinatra::Base
  enable :sessions, :method_override

  delete '/bookmarks/:id' do

  HandleUrl.delete_url(params['id'])
  redirect '/bookmarks'
  end

  get '/' do
    erb(:index)
  end

  get '/add_page' do
    erb :'/bookmarks/add'
  end

  post '/add_urls' do
    @url = Url.create(params[:new_url], params[:title])

    redirect '/add_url'
  end

  get '/add_url' do
    @url = Url.instance
    HandleUrl.add_url(@url.address, @url.title)

    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'/bookmarks/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
