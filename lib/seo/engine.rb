module Seo
  class Engine < ::Rails::Engine
    isolate_namespace Seo

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.view_specs false
      g.template_engine :slim
      g.assets false
      g.helper false
    end
    
    config.header_meta_tags = { title: '', description: '', keywords: '' }
  end
end
