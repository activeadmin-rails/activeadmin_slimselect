# ActiveAdmin SlimSelect

An Active Admin plugin to use [SlimSelect.js](https://slimselectjs.com/) (no jQuery required).

Features:
- Modern select inputs with search
- AJAX content loading
- Single and multiple selection support
- No jQuery dependency
- Turbo and Turbolinks compatible

## Install

- Add to your Gemfile:
  ```ruby
  gem 'activeadmin_slimselect'
  ```
- Execute bundle
- Add at the end of your ActiveAdmin styles (_app/assets/stylesheets/active_admin.scss_):
  ```scss
  @import 'activeadmin/slimselect_input';
  ```
- Add at the end of your ActiveAdmin javascripts (_app/assets/javascripts/active_admin.js_):
  ```js
  //= require activeadmin/slimselect/slimselect
  //= require activeadmin/slimselect_input
  ```
- Use the input with `as: :slimselect` in Active Admin model conf

Why 2 separated scripts? This way you can include a different version of SlimSelect.js if you prefer.

## Usage

### Basic Form Input

```ruby
# ActiveAdmin article form conf:
form do |f|
  f.inputs 'Article' do
    f.input :title
    f.input :category, as: :slimselect
    f.input :tags, as: :slimselect, collection: Tag.all
  end
  f.actions
end
```

### With AJAX Remote Data

For associations with many records, use AJAX loading:

```ruby
form do |f|
  f.inputs 'Article' do
    f.input :title
    f.input :tags,
            as: :slimselect,
            collection: f.object.tags,
            input_html: {
              'data-opt-remote': admin_tags_path(format: :json),
              'data-opt-text': 'name',
              'data-opt-value': 'id',
              placeholder: 'Search for a tag...'
            }
  end
  f.actions
end
```

### Filter Input

```ruby
# Without remote items (no AJAX):
filter :category_id_eq, as: :slimselect, collection: Category.all

# With remote items:
filter :tags_id_eq,
       as: :slimselect,
       collection: [],
       input_html: {
         'data-opt-remote': '/admin/tags.json',
         'data-opt-text': 'name',
         'data-opt-value': 'id',
         placeholder: 'Search for a tag...'
       }
```

## Options

Pass options using `input_html` data attributes:

| Attribute | Description | Default |
|-----------|-------------|---------|
| `data-opt-remote` | URL for AJAX search requests (GET) | - |
| `data-opt-text` | Field to use as option label | `text` |
| `data-opt-value` | Field to use as select value | `value` |
| `data-opt-*` | Any SlimSelect setting in kebab-case | - |
| `data-opts` | JSON object to override all SlimSelect settings | - |

### Examples

```ruby
# Custom SlimSelect settings via data attributes:
f.input :category,
        as: :slimselect,
        input_html: {
          'data-opt-close-on-select': 'false',
          'data-opt-allow-deselect': 'true',
          placeholder: 'Select a category...'
        }

# Or via JSON object:
f.input :category,
        as: :slimselect,
        input_html: {
          'data-opts': '{"closeOnSelect":false,"allowDeselect":true}',
          placeholder: 'Select a category...'
        }
```

## JSON Endpoint

For AJAX to work, enable JSON routes in ActiveAdmin (controlled by `download_links` option):

```ruby
index download_links: [:csv, :json] do
  # ...
end
```

Customize the JSON response by overriding `as_json` in your model:

```ruby
def as_json(options = nil)
  super({ only: [:id], methods: [:name] }.merge(options || {}))
end
```

## SlimSelect Documentation

For all available settings and events, see the [SlimSelect documentation](https://slimselectjs.com/settings).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/varyonic/activeadmin_slimselect.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
