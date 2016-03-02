module Seo
  module ControllerMacro
    def enable_seo(*args)
      before_action(*args) do |controller|
        seo_model = Seo::Model.params(params).take
        @seo      = if seo_model.present?
                      seo_model.record(params)
                    else
                      Seo::Page.create_seo(params).seo_records
                    end
      end
    end
  end
end