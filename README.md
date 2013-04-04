[![Build Status](https://travis-ci.org/crowdint/hogger.png?branch=master)](https://travis-ci.org/crowdint/hogger)
[![Coverage Status](https://coveralls.io/repos/crowdint/hogger/badge.png?branch=master)](https://coveralls.io/r/crowdint/hogger)
[![Code Climate](https://codeclimate.com/github/crowdint/hogger.png)](https://codeclimate.com/github/crowdint/hogger)

# Hogger

VERY lightweight web application framework for Ruby

## Why?

To teach new programmers the basic of MVC without necesarily exposing them to a
big Framework like Rails.

We don't need Ruby on Rails Engineers in the world, we need Ruby Engineers.

While Ruby on Rails allows you to easily forget about the entrails of a web app,
this Framework is about the opposite thing.

## Current Status

You can create an app skeleton running the following command:

    hogger NewApp

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

# About the Author

[Crowd Interactive](http://www.crowdint.com) is a leading Ruby and Rails
consultancy firm based in Mexico currently doing business with startups in
the United States. We specialize in building and growing your existing
development team, by adding engineers onsite or offsite. We pick our clients
carefully, as we only work with companies we, believe in. Find out more about
us on our [website](http://www.crowdint.com).
