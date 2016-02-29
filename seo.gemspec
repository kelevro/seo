$:.push File.expand_path('../lib', __FILE__)

require 'seo/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'seo'
  s.version     = Seo::VERSION
  s.authors     = ['Anton Holovko']
  s.email       = ['anton.holovko.b@gmail.com']
  s.homepage    = 'localhost:3000'
  s.summary     = 'Simple assign seo meta-data'
  s.description = 'Simple assign seo meta-data'
  s.license     = 'MIT'

  s.files = Dir['Gemfile', '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails'
  s.add_dependency 'globalize'
  s.add_dependency 'globalize-accessors'
  s.add_dependency 'slim'
  s.add_dependency 'meta-tags'
  s.add_dependency 'sass-rails'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'breadcrumbs_on_rails'
  s.add_dependency 'simple_form'
  s.add_dependency 'font-awesome-sass'
  s.add_dependency 'multilang_field'
end
