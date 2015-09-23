require_relative '../../app/app'

module Backend
  RSpec.describe 'Application' do
    def app
      Backend::App
    end

    describe 'POST /' do
      context 'with ill formed requests' do
        it 'should return 422' do
          post '/'
          expect(last_response.status).to eq(422)
        end
      end

      context 'with well formed requests' do
        it 'should accept the request' do
          post '/', "{}", "CONTENT_TYPE" => "application/json"
          expect(last_response.status).to eq(200)
        end
      end
    end

    describe 'GET /stats' do
      it 'should accept incoming requests' do
        get '/stats'
        expect(last_response.status).to eq(200)
      end
    end
  end
end
