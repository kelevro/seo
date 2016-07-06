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

module Seo
  class Record < ::ActiveRecord::Base
    translates :title, :description, :keywords, :seo_text

    before_validation :add_validators
    after_validation :clear_validators

    accepts_nested_attributes_for :translations

    scope :action, -> (action) do
      where(action: action).order(:id) if action.present?
    end

    def add_validators
      return if seoable_type.blank?
      model = seoable_type.constantize
      return if model.validation_block.blank?
      self.class_eval &model.validation_block
    end

    def clear_validators
      self.class.clear_validators!
    end

    def header_attributes
      attrs               = {}
      attrs[:title]       = title if title.present?
      attrs[:description] = description if description.present?
      attrs[:keywords]    = keywords if keywords.present?
      attrs
    end
  end
end
