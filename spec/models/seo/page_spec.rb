# == Schema Information
#
# Table name: seo_pages
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

module Seo
  describe Page, type: :model do
    describe '.create_seo' do
      let(:params) { { controller: :articles, action: :index } }

      it 'will success create Seo::Page' do
        expect { described_class.create_seo(params) }
          .to change { described_class.count }.by(1)
      end

      it 'will success create Seo::Model' do
        expect { described_class.create_seo(params) }
          .to change { Seo::Model.count }.by(1)
      end

      it 'will create Seo::Model with correct values' do
        page = described_class.create_seo(params)
        model = Seo::Model.last
        expect(model.controller).to eq(params[:controller].to_s)
        expect(model.action).to eq(params[:action].to_s)
        expect(model.model).to eq(described_class.to_s)
        expect(page.seo_model).to eq(model)

      end

      it 'will success create Seo::Record' do
        expect { described_class.create_seo(params) }
          .to change { Seo::Record.count }.by(1)
      end

      it 'will have seo relation' do
        page = described_class.create_seo(params)
        seo = Seo::Record.last
        expect(page.seo_records.first).to eq(seo)
      end
    end
  end
end
