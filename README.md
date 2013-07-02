[![Build Status](https://travis-ci.org/crowdint/harry.png?branch=master)](https://travis-ci.org/crowdint/harry)
[![Coverage Status](https://coveralls.io/repos/crowdint/harry/badge.png?branch=master)](https://coveralls.io/r/crowdint/harry)
[![Code Climate](https://codeclimate.com/github/crowdint/harry.png)](https://codeclimate.com/github/crowdint/harry)

# Harry

VERY lightweight web application framework for Ruby. There's no magic in Harry.

Works with Ruby 2.0.0

## Why?

To teach new programmers the basic of MVC without necesarily exposing them to a
big Framework like Rails.

We don't need Ruby on Rails Engineers in the world, we need Ruby Engineers.

While Ruby on Rails allows you to easily forget about the entrails of a web app,
this Framework is about the opposite thing.

That means, no Convention over Configuration, no magic behind paths, routes, models
or any sugar Rails add to your life.

## Current Status

You can create an app skeleton running the following command:

    harry NewApp

Notice that you need to pass the app name as a Ruby class name.

### Sample App

To use the sample app go to the *sample-app* directory and run:

    rackup

This app has one controller: *HelloController* and is routed to the */hello* path.

Use your browser to go to *http://127.0.0.1:9292/hello* and you should see the classic
Hello World message.

The action accepts the name parameter, so, if you go to *http://127.0.0.1:9292/hello?name=John*
you will see *Hello World John*.

The app file structure is similar to Rails, figure out what the files do.

# Want to help?

You'll need Ruby 2.0.0

Here's a list of things that still need addressing:

* Serving static files
* More Routing options
* Do all request methods work? (POST, DELETE, PUT). Update the sample-app.
* Models. How are we going to handle DB access? Remember: no magic.
* Different environments: development, production, test?
* Reload all files while in development mode.
* More wiki pages.

Please, test your code.

# About the Author

[Crowd Interactive](http://www.crowdint.com) is a leading Ruby and Rails
consultancy firm based in Mexico currently doing business with startups in
the United States. We specialize in building and growing your existing
development team, by adding engineers onsite or offsite. We pick our clients
carefully, as we only work with companies we, believe in. Find out more about
us on our [website](http://www.crowdint.com).
