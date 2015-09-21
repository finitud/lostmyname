require_relative '../../app/app'

module Backend
  RSpec.describe 'Application' do
    def app
      Backend::App
    end

    it 'should accept incoming POST requests' do
      post '/'
      expect(last_response.status).to eq(200)
    end
  end
end
