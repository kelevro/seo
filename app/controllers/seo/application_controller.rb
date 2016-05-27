class Seo::ApplicationController < ActionController::Base
  layout 'seo/application'

  def initialize
    super
    I18n.locale = :en
  end
end
