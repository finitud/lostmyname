require_relative '../../app/app'

module Backend
  RSpec.describe 'Application' do
    def app
      Backend::App
    end

    describe 'endpoint /' do
      it 'should accept incoming POST requests' do
        post '/'
        expect(last_response.status).to eq(200)
      end
    end

    describe 'endpoint /stats' do
      it 'should accept incoming GET requests' do
        get '/stats'
        expect(last_response.status).to eq(200)
      end
    end
  end
end
