require 'sinatra/base'

class BookMarkManager < Sinatra::Base

  get '/' do
    'hello world'
  end
  run! if app_file == $0
end
