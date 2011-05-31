# Pictor

An XMPP Group Chat image search bot in the spirit of Github's Hubot.

## Running Pictor

* Using ARGV:
`$ bundle exec ruby bin/pictor foo@bar.com baz room@conference.host Pictor GoogleImageSearchKey`

* Using ENV:
`$ export JID=foo@bar.com PASS=baz ROOM=room@conference.host NICK=Pictor Key=GoogleImageSearchKey`
`$ bundle exec ruby bin/pictor`

* If you have installed Pictor as a RubyGem and have the `bin` directory on your `$PATH` you may simply call `$ pictor ...`
* The repository also contains a `Procfile` suitable for running Pictor on [Heroku](http://heroku.com/)'s [Cedar](http://devcenter.heroku.com/articles/cedar) stack. Set your ENV using `$ heroku config:add KEY=VALUE` and then `$ heroku scale worker=1`.

## Contributing to Pictor
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 W. Andrew Loe III. See LICENSE.txt for
further details.

