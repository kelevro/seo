require 'rails_helper'

describe ArticleWithoutSeo do
  describe '.add_seo' do
    it 'will respond to this method' do
      expect(described_class).to respond_to(:add_seo)
    end

    it 'will create new record Seo::Model' do
      expect { described_class.add_seo :articles, :show, :id }
        .to change { Seo::Model.count }.by(1)
    end

    it 'will raise ArgumentError' do
      expect { described_class.add_seo :articles, :show }
        .to raise_error(ArgumentError)
    end

    it 'will not create new record Seo::Model if exists' do
      described_class.add_seo(:articles, :show, :id)
      expect { described_class.add_seo(:articles, :show, :id) }
        .to_not change { Seo::Model.count }
    end

    it 'will have have_one relation to Seo::Record' do
      described_class.add_seo(:articles, :show, :id)
      is_expected.to have_many(:seo_records)
    end

    it 'will add Seo::Record as nested model' do
      described_class.add_seo(:articles, :show, :id)
      is_expected.to accept_nested_attributes_for(:seo_records)
    end

    it 'will have not validators' do
      expect(described_class.validators.count).to eq(0)
    end

    it 'will add validators to Seo::Record before validation' do
      described_class.add_seo(:articles, :show, :id) do
        validates :title, presence: true
      end
      allow_any_instance_of(Seo::Record).to receive(:clear_validators)
      described_class.new(seo_records_attributes: [{}]).valid?
      expect(Seo::Record.validators.count).to eq(1)
    end


    it 'will remove validators from Seo::Record after validation' do
      described_class.add_seo(:articles, :show, :id) do
        validates :title, presence: true
      end

      described_class.new(seo_records_attributes: [{ title: 'hello' }]).valid?
      expect(Seo::Record.validators.count).to eq(0)
    end

    it 'will validate Seo::Record' do
      described_class.add_seo(:articles, :show, :id) do
        validates :title, presence: true
      end
      expect(described_class.new(seo_records_attributes: [{}]).valid?)
        .to be_falsey
    end

    it 'will correct work with several calls' do
      described_class.add_seo(:articles, :show, :id)
      described_class.add_seo(:articles, :show, :id) do
        validates :title, presence: true
      end
    end

    it 'will init seo relation model' do
      described_class.add_seo(:articles, :show, :id)
      expect(described_class.create.create_seo.first)
        .to be_instance_of(Seo::Record)
    end

    it 'will set default params to seo relation model' do
      described_class.add_seo(:articles, :show, :id)
      article = described_class.create
      article.create_seo
      expect(article.seo_records.first.action).to eq('show')
    end

    it 'will set default params to seo relation model' do
      described_class.add_seo(:articles, :show, :id)
      article = described_class.create
      article.create_seo
      expect(article.seo_records.first.action).to eq('show')
    end

    it 'will be' do
      described_class.add_seo(:articles, :show, :id) do
        validates :title, length: { maximum: 500 }
      end
      Article.new(title: '')
      expect(Article.validation_block).to_not eq(described_class.validation_block)
    end
  end
end