# Differin Renderers Text

**Extension for [Differin](http://github.com/MrEmelianenko/differin)** adds the ability to render processed data as text.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'differin', '~> 0.1.0'
gem 'differin-renderers-text', '~> 0.1.0'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install differin-renderers-text

## Usage

~~~ruby
require 'differin'
require 'differin/renderers/text'

diff = Differin::Diff.new('examples/file1.txt', 'examples/file2.txt')
diff.process(renderer: Differin::Renderers::Text)

# or

Differin.diff('examples/file1.txt', 'examples/file2.txt', renderer: Differin::Renderers::Text)
~~~

Result of these commands:
~~~
Differin: 0.1.0
file1.txt <=> file2.txt
***********************
* Some|Another
- Simple
= Text
= File
+ With
+ Additional
+ Lines
~~~

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/differin. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

