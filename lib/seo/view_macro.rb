module Seo
  module ViewMacro
    def header_meta_tags
      if @seo.present?
        display_meta_tags(@seo.header_attributes)
      end
    end
  end
end