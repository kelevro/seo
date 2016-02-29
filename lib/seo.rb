require 'active_record'
require 'seo/engine'

module Seo
  mattr_accessor :app_path

  autoload :ActMacro, 'seo/act_macro'
  autoload :ControllerMacro, 'seo/controller_macro'
  autoload :ViewMacro, 'seo/view_macro'
end

Seo.app_path = :root_path

ActiveRecord::Base.extend(Seo::ActMacro)
ActionController::Base.extend(Seo::ControllerMacro)
ActionView::Base.include(Seo::ViewMacro)
