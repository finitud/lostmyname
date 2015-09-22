require 'sinatra/base'

module Backend
  class App < Sinatra::Application

    post  '/' do
      200
    end

    get '/stats' do
      200
    end

  end
end
