require 'sinatra/base'

module Backend
  class App < Sinatra::Application

    post  '/' do
      200
    end

  end
end