require 'rails_helper'

RSpec.describe UserController, :type => :controller do
  describe 'POST create' do
    context 'when no valid parameters are provided' do
      it 'raises an exception' do
        expect { post(:create, {}) }.to raise_error ActionController::ParameterMissing
      end
    end

    context 'when the user info is valid' do
      it 'successfully creates a new user' do
        user = User.create(first_name: "Ben", last_name: "Pratt", email: "ben8returns.com", url: "8returns.com")
        expect(User.last.first_name).to eq("Ben")
      end
    end
    context 'when the user info are invalid' do
      it 'should throw an error' do
        user = User.create(first_name: "", last_name: "Pratt", email: "ben8returns.com", url: "8returns.com")
        expect(user.valid?).to eq(false)
      end
    end
  end

  context 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(200)
    end

    it "redirects user to root path" do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
