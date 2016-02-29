### Seo


## Install
```ruby
  gem 'seo'
  gem 'multilang_field'
```

# Migrations
```console
  rake seo:install:migrations
```

# Routes
```ruby
  mount Seo::Engine => '/seo'
```

# Assign to model
For example Article model
```ruby
  add_seo :articles, :show, :id
```

`:articles` - controller name 
`:show` - action name
`:id` - param name

If you need validation to seo data

```ruby
  add_seo :articles, :show, :id do
    validates :title, :description, presence: true
  end
```

# View
```erb
<%= simple_form_for(@article) do |f| %>
  <%= f.input :title %>
  <%= f.input :content %>
  <div class="col-sm-offset-1">
    <%= f.simple_fields_for :seo do |seo_form| %>
      <%= multilang_wrapper(:title) { |attribute| seo_form.input attribute } %>
      <%= multilang_wrapper(:description) { |attribute| seo_form.input attribute, as: :text } %>
      <%= multilang_wrapper(:keywords) { |attribute| seo_form.input attribute } %>
      <%= multilang_wrapper(:seo_text) { |attribute| seo_form.input attribute, as: :text } %>
    <% end %>
  </div>

  <%= f.submit %>
<% end %>
```

# Controller
```ruby
  def article_params
    seo_params = Seo::Record.globalize_attribute_names + [:id]
    params.require(:article).permit(:title, :content,
                                    seo_attributes: seo_params)
  end
```


