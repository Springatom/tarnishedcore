require 'rails_helper'


RSpec.describe "Sessions", type: :request do
  describe "会话" do
    it "能创建会话" do
      User.create email: 'Springatom@hotmail.com'
      post '/api/v1/session', params: { email: 'Springatom@hotmail.com', code: '926401' }
      expect(response).to have_http_status(200)
      data = JSON.parse response.body
      expect(data['jwt']).to be_a(String)
    end
  end
end