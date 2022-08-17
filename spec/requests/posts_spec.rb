require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) { get user_posts_path user_id: 2 }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'should render the correct text in the template' do
      expect(response.body).to include('Display Users Posts')
    end
  end

  describe 'GET /show' do
    before(:each) { get user_post_path user_id: 10, id: 6 }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render the correct template' do
      expect(response).to render_template(:show)
    end
    it 'should have the text Posts' do
      expect(response.body).to include('Show Post Details')
    end
  end
end
