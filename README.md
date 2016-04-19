# GosuAPI

GosuAPI is a gem created to communicate with the GosuGamers.net Matchticker.
The main goals of this gem are:

- Request information from the GosuGamers.net Matchticker API.

## Installation

Just add the following to your Gemfile.

```ruby
gem 'gosuapi'
```

And follow that up with a ``bundle install``.

Then generate the initializer file with this command

``bin/rails generate gosuapi:install``

Now all you have to do is set your API key in the intitalizer file and you're good to go.

## Usage

```ruby
GosuApi::GAMES.keys.each do |game|

  matchticker = GosuApi::Matchticker.new
  matchticker.get_matches(game.to_s)

end
```

## License

GosuAPI is released under the [MIT License](http://www.opensource.org/licenses/MIT).

## TODO

- Write test code (I know, I'm terrible)


- Other GosuGamers API functionality
