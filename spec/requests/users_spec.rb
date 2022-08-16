require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) { get users_path user_id: 20 }

    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'should render the correct text in the template' do
      expect(response.body).to include('Display Users')
    end
  end

  describe 'GET /show' do
    before(:each) { get user_path(32) }

    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:ok)
    end

    it 'should render the show template ' do
      expect(response).to render_template(:show)
    end

    it 'should have the text Posts' do
      expect(response.body).to include('Show User Details')
    end
  end
end
