module Seo
  module ControllerInstanceMacro
    def build_seo_params
      Seo::Record.globalize_attribute_names + [:id, :action]
    end

    def load_seo(model)
      model.create_seo
      @seo = model.seo_records.action(params[:seo_action]).first
      if @seo.blank?
        @seo = model.seo_records.first
        if params[:seo_action].present?
          @seo = model.seo_records.select do |seo|
            seo.action == params[:seo_action]
          end.first
        end
      end
    end
  end
end
