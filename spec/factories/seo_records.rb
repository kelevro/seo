# == Schema Information
#
# Table name: seo_records
#
#  id           :integer          not null, primary key
#  seoable_id   :integer          not null
#  seoable_type :string           not null
#  controller   :string           not null
#  action       :string           not null
#  param_name   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :seo_record, class: Seo::Record do
    title 'First article'
    description 'Description for first article'
    keywords 'keyword1, keyword2'
    seo_text 'Seo text for article 1.'
  end
end
