# == Schema Information
#
# Table name: seo_pages
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module Seo
  class Page < ::ActiveRecord::Base
    add_seo
    has_one :seo_model, class_name: 'Seo::Model', dependent: :destroy

    def self.create_seo(params)
      page = self.create!(name: build_name(params[:controller], params[:action]))

      Seo::Model.create!(model:  Seo::Page.to_s, controller: params[:controller],
                        action: params[:action], page_id: page.id)

      Seo::Record.new(seoable_id:   page.id,
                      seoable_type: page.class.to_s)
      page
    end

    private

    def self.build_name(controller, action)
      "#{controller.capitalize}##{action}"
    end
  end
end
