# Traktion

Supports reading track data exported from iTunes flat files and
converting it into structured data. 

For now, Traktion only supports plain text data exports as a source
format. It builds them into loosely structured hashes where the
resulting keys are only preserved if they have corresponding values.
This structure makes them suitable for document-based persistence.

## Installation

Add this line to your application's Gemfile:

    gem 'track_data'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install track_data

## Usage

To read in a plain text file exported from iTunes, build an instance of
Pathname from the path to the file:

```ruby
pathname = Pathname.new('path/to/file.txt')
```

Then pass this to Traktion::FromPlainText and call the process method
on the resulting instance:

```ruby
from_plain_text = Traktion::FromPlainText.use(pathname)
from_plain_text.process
```

The data can then be inspected in its raw form or in the loosely
structured form by calling the appropriate accessors:

```ruby
from_plain_text.raw
from_plain_text.track_data
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/track_data/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
