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

module Seo
  class Model < ::ActiveRecord::Base

    belongs_to :page, class_name: 'Seo::Page'

    def self.params(params)
      where(controller: params[:controller], action: params[:action])
    end

    def record(params)
      if static_page?
        page.seo
      else
        Record.where(seoable_id:   params[self.param_name.to_sym],
                     seoable_type: self.model).take
      end
    end

    private

    def static_page?
      self.model == 'Seo::Page'
    end
  end
end
