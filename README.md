Instructions
============

* To run the project:

```
$ bundle install
$ bundle exec rackup
```

* To run the specs:

```
$ bundle exec rspec spec/
```

The 'llirdnam' binary for OS X has been copied into the bin/ folder for convenience.

Comments
========

* I normally use rvm for development. The project contains .ruby-version and .ruby-gemset files,
  which should allow the above commands to be run without 'bundle exec' for convenience.

* Using sqlite3 for development, but will use postgres on production for easy deploy to heroku.

* An alternative would be MongoDB, which would be convenient in this case due to its ability to
  consume JSON directly. However postgres is usually considered faster and more reliable.

* Initially we're not performing any validation on the data - we assume for the moment that the
  sample data generator is generating valid data.

* Next steps would be to refactor app.rb into an ApplicationController and a StatsController,
  since these two are separate concerns.

* The stats code needs proper unit testing.


Possible further improvements
=============================

* The stats page could auto-update periodically, or receive update events.

* Plots
