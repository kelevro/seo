# == Schema Information
#
# Table name: seo_models
#
#  id         :integer          not null, primary key
#  model      :string
#  controller :string
#  action     :string
#  param_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

module Seo
  RSpec.describe Model, type: :model do
    describe '#record' do
      context 'static model' do
        let(:params) { { controller: :articles, action: :index } }
        before do
          @page = Seo::Page.create_seo(params)
        end

        it 'will return correct model' do
          model = described_class.params(params).take
          expect(@page).to eq(model.record(params))
        end
      end

      context 'dynamic models' do

        it 'will return model' do
          article = create(:article_with_seo)
          params = {controller: :articles, action: :show, id: article.id}
          model = described_class.params(params).take
          expect(model.record(params)).to eq(article.seo)
        end
      end
    end
  end
end
