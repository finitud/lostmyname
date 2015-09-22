require 'sinatra/base'
require 'sinatra/activerecord'

module Backend
  class App < Sinatra::Application
    register Sinatra::ActiveRecordExtension

    post  '/' do
      200
    end

    get '/stats' do
      200
    end

  end
end
