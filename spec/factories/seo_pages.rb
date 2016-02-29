# == Schema Information
#
# Table name: seo_pages
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :seo_page, class: 'Seo::Page' do
  end
end
