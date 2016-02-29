FactoryGirl.define do
  factory :article do
    title 'First Article'
    content 'First Article content'

    factory :article_with_seo do
      before(:create) {|article| article.build_seo(attributes_for(:seo_record)) }
    end
  end
end