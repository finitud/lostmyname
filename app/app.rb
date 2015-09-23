require 'sinatra/base'
require 'sinatra/activerecord'
require 'json'

require_relative './models/email_data'

module Backend
  class App < Sinatra::Application
    register Sinatra::ActiveRecordExtension

    post  '/' do
      payload = request.body.read

      begin
        json = JSON.parse(payload)
      rescue JSON::ParserError
        return 400
      end

      data = EmailData.new

      begin
        data.address = json.fetch('Address')
        data.email_type = json.fetch('EmailType')
        data.event = json.fetch('Event')
        data.timestamp = json.fetch('Timestamp')
      rescue KeyError
        return 422
      end

      data.save!

      200
    end

    get '/stats' do
      200
    end

  end
end
