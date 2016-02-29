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

FactoryGirl.define do
  factory :seo_model, class: 'Seo::Model' do
    
  end
end
