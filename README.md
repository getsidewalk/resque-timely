# Resque Timely

## Installation

Add this line to your application's Gemfile:

    gem "resque-timely"

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install resque-timely

## Usage

Resque Timely requires you to do two things:

1. Include Resque::Plugins::Timely in your Resque Job class
2. Implement the timely_timeout class method to return the timeout in seconds

For example:
```ruby
class YourTimelyJob
  include Resque::Plugins::Timely

  def self.timely_timeout
    3 # 3 seconds
  end
end
```

## Requirements

Resque Timeout will only work with 1.9.x and above. Specifically it's tested with 1.9.3.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request