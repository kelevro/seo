require 'rails_helper'

module Seo
  describe PagesController, type: :controller do

    describe 'GET #index' do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #edit' do
      it 'returns http success' do
        get :edit
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #update' do
      it 'returns http success' do
        update :update
        expect(response).to have_http_status(:success)
      end
    end

  end
end
