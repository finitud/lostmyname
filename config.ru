APP_ROOT ||= File.dirname(__FILE__)

require APP_ROOT + '/config/environment.rb'

run Backend::App.new('/' => Backend::App)
