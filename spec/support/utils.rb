def reload_article_class
  load File.join Rails.root, 'app', 'models', 'article.rb'
end