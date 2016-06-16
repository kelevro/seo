require 'rails_helper'

describe ArticlesController, type: :controller do
  describe '.enable_seo' do
    it 'will respond to' do
      expect(described_class).to respond_to(:enable_seo)
    end

    context 'GET #index' do
      it 'will create Seo::Model model' do
        expect{ get :index }
          .to change{ Seo::Model.params(controller: :articles, action: :index).count }
                .by(1)
      end

      it 'will create Seo::Page model' do
        expect{ get :index }.to change{ Seo::Page.count }.by(1)
      end

      it 'will create Seo::Record model' do
        get :index
        expect(Seo::Record.count).to eq(1)
      end
    end

    context 'GET #show' do
      it 'will assign @seo' do
        article = create(:article_with_seo)
        reload_article_class
        get :show, id: article
        expect(assigns(:seo)).to eq(article.seo)
      end
    end

    context 'POST #create' do
      it 'will create Seo::Record' do
        expect{ post :create, article: {seo_attributes: attributes_for(:seo_record)} }
          .to change{ Seo::Record.count }.by(1)
      end

      it 'will set correct attributes' do
        seo_attributes = attributes_for(:seo_record)
        post :create, article: {seo_attributes: attributes_for(:seo_record)}
        seo = Article.first.seo
        expect(seo.title).to eq(seo_attributes[:title])
        expect(seo.description).to eq(seo_attributes[:description])
        expect(seo.keywords).to eq(seo_attributes[:keywords])
        expect(seo.seo_text).to eq(seo_attributes[:seo_text])
      end
    end
  end
end