# frozen_string_literal: true

require 'sinatra/base'
require_relative 'lib/bookmark'
require_relative 'lib/handle_url'
require_relative 'lib/url'
require_relative './lib/database_connection_setup'

# class comment...
class BookMarkManager < Sinatra::Base
  enable :sessions, :method_override

  delete '/bookmarks/:id' do
    HandleUrl.delete_url(params['id'])
    redirect '/bookmarks'
  end

  post '/update_bookmark_params' do
    @id = params['Uid']
    @url = params['Uurl']
    @title = params['Utitle']
    erb :'/bookmarks/update'
  end

  post '/update_bookmark' do
    @id = params['id']
    @url = params['new_url']
    @title = params['new_title']
    HandleUrl.update_url(@id, @url, @title)

    redirect '/bookmarks'
  end

  get '/' do
    erb(:index)
  end

  get '/add_page' do
    erb :'/bookmarks/add'
  end

  get '/update_bookmark' do
    erb :'/bookmarks/update'
  end

  post '/add_urls' do
    @url = Url.create(params[:new_url], params[:title])

    redirect '/add_url'
  end

  post '/update_bookmark' do
    HandleUrl.update_url(params['url'], params['title'])

    redirect '/bookmarks'
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
