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

require 'rails_helper'

module Seo
  RSpec.describe Record, type: :model do

    it { is_expected.to have_many(:translations) }

    it 'will be valid factory' do
      expect(build(:seo_record).valid?).to be_truthy
    end
  end
end
