# lita-exclusive-route

[![Build Status](https://travis-ci.org/Maysora/lita-exclusive-route.png?branch=master)](https://travis-ci.org/Maysora/lita-exclusive-route)
[![Code Climate](https://codeclimate.com/github/Maysora/lita-exclusive-route.png)](https://codeclimate.com/github/Maysora/lita-exclusive-route)
[![Coverage Status](https://coveralls.io/repos/Maysora/lita-exclusive-route/badge.png)](https://coveralls.io/r/Maysora/lita-exclusive-route)

**lita-exclusive-route** is an extension for [Lita](https://www.lita.io/) that allows handler exclusive routes which only trigger when no prior routes already triggered

## Installation

Add lita-exclusive-route to your Lita plugin's gemspec:

``` ruby
spec.add_runtime_dependency "lita-exclusive-route"
```

## Usage

To make route exclusive simply add `exclusive: true` to it

```ruby
# example from lita-responder
# this route will catch all chat commands but only if there's no other routes catching it before this
route %r{^(.+)$}, :ask_responder, command: true, exclusive: true
```

### Bonus

It's also possible to get array of routes which caught a chat message by accessing message instance variable :

```ruby
# inside handler route callback method
response.message.instance_variable_get('@routes') # return array of Lita::Handler::Route triggered before current route
```

## License

[MIT](http://opensource.org/licenses/MIT)
