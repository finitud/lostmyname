require 'sinatra/base'
require 'sinatra/activerecord'
require 'json'

require_relative './models/email_data'

module Backend
  class App < Sinatra::Application
    register Sinatra::ActiveRecordExtension

    Tilt.register Tilt::ERBTemplate, 'html.erb'

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
      emails_by_event = EmailData.group(:event).count

      @emails_sent = emails_by_event.fetch('send', 0)
      @emails_opened = emails_by_event.fetch('open', 0)
      @clicks = emails_by_event.fetch('click', 0)

      @open_rates = {}
      @click_rates = {}

      emails_per_type = EmailData.group(:email_type).count
      emails_opened_per_type = EmailData.where(event: 'open').group(:email_type).count
      clicks_per_type = EmailData.where(event: 'click').group(:email_type).count

      emails_per_type.keys.each do |key|
        @open_rates[key] =  emails_opened_per_type.fetch(key, 0.0).to_f / emails_per_type.fetch(key)
        @click_rates[key] =  clicks_per_type.fetch(key, 0.0).to_f / emails_per_type.fetch(key)
      end

      erb :stats
    end

  end
end
