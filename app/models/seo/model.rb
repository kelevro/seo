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

    belongs_to :page, class_name: 'Seo::Page', dependent: :destroy

    scope :model, -> (model) { where(model: model.to_s).order(:id) }
    scope :params, -> (params) { where(controller: params[:controller], action: params[:action]) }

    def record(params)
      if static_page?
        page.seo_records.first
      else
        load_seo(params)
      end
    end

    private

    def load_seo(params)
      query_param = {}
      param       = params[self.param_name.to_sym]
      model_class = self.model.constantize
      if param.to_i == 0
        query_param[self.param_name.to_sym] = param
      else
        query_param[:id] = param.to_i
      end

      target_model = model_class.find_by(query_param)
      return if target_model.nil?
      target_model.seo_records.action(params[:action]).first
    end

    def static_page?
      self.model == 'Seo::Page'
    end
  end
end
