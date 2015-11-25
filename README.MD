
# This is an example project for the class WT1: Web applications

[![Build Status](https://travis-ci.org/htw-imi-wt1wa-ws2015/diversity-poll.svg?branch=master)](https://travis-ci.org/htw-imi-wt1wa-ws2015/diversity-poll)

Heroku: https://diversity-poll.herokuapp.com/

## Setting up the rails project

I usually create a specific gemset for each project.

    rvm gemset create diversity
    rvm gemset list
    rvm gemset use diversity
    gem install rails
    rails new diversity-poll
    cd diversity-poll/
    git init
    git add .
    git commit -m "new rails app"
    rvm --ruby-version use 2.2.3@diversity
    git add .
    git commit -m "rvm --ruby-version use 2.2.3@diversity"
    rvm list
    rvm gemset list

## adding rspec

I like to add rspec early in the project such that rspec tests will be generated.
You can skip that.

    atom Gemfile
    bundle
    rails generate rspec:install
    bundle exec rspec
    git add .
    git commit -m "added rspec, see https://github.com/rspec/rspec-rails"

## Creating MVC using generate Scaffold

    rails g scaffold Poll name:string description:text
    less db/migrate/20151104165955_create_polls.rb
    rake db:migrate
    bundle exec rspec
    rails server
    open http://localhost:3000
    git add .
    git commit -m "rails g scaffold Poll name:string description:text"

## Adding Twitter Bootstrap (less version)

see also http://railscasts.com/episodes/328-twitter-bootstrap-basics?view=asciicast
I did this in a special branch in case I wanted to discard it.

    git checkout -b bootstrap
    bundle
    rails generate bootstrap:install less
    git add .
    git commit -m "added twitter bootstrap"
    git status
    rails g bootstrap:themed Polls
    git commit -m "rails g bootstrap:themed Polls"

Looked good, so I decided to keep it and integrate it to my main branch (tryout)
and delete the bootstrap branch again.

    git status
    git lg1
    git checkout tryout
    git rebase bootstrap
    git lg1
    git branch -d bootstrap

Generated new application layout later:

    rails g bootstrap:layout

Twitter Bootstrap uses Internationalization: the .t is short for the translation
helper using the texts defined in `config/locales` - see http://guides.rubyonrails.org/i18n.html
While it is a good idea to incorporate this early on, it can slow you down too
much while just experimenting.

## More models

    rails g scaffold Dimension name:string description:text
    rake db:migrate
    git add .
    git commit -m "rails g scaffold Dimension name:string description:text"
    rails g scaffold Value label:string dimension:references
    git add .
    git commit -m "rails g scaffold Value label:string dimension:references"


... and so on.

## Issues
Twitter Bootstrap generates text_fields also for texts instead of text_areas;
this causes the generated test to fail.
      <%= f.hidden_field(:dimension_id, value: @value.dimension_id) %>

## Troubleshooting Hints
First, make sure you found and read the error message. If you don't understand it,
try to google the generic part of the error message. That is, remove any
identifiers that are specific to your application - these are often model names.
Answers found on Stackoverflow are usually a good bet.

## Heroku deployment
Deploying a rails app to heroku has become quite easy. First, you have to create an
account on heroku.com. You can setup ssh keys to avoid having to be prompted for a log in.

see https://devcenter.heroku.com/articles/getting-started-with-rails4

    gem install heroku
    heroku create
    git push heroku master
    git commit -m "heroku: prepared gems"
    git push heroku master
    heroku run rake db:migrate
    heroku run rake db:populate
    heroku open
    heroku logs

The deployed app is at https://diversity-poll.herokuapp.com/

## Setup Travis CI
Travis CI is a Continuous Integration Service - or, more precisely, an
automated build server - that integrates nicely with GitHub and Heroku.

### Setup Travis build

- sign in to http://travis-ci.org with your GitHub account.
- click on your profile and find your organisations/github projects.
http://docs.travis-ci.com/user/languages/ruby/
- Add Travis Service to your github repository on the settings page, e.g. https://github.com/htw-imi-wt1wa-ws2015/diversity-poll/settings/hooks
- provide a .travis.yml config file in your repository, see below.

### Travis Setup (.travis.yml)
See the .travis.yml in this example project and http://docs.travis-ci.com/user/languages/ruby/
to see how I setup travis.

As we'll be using rspec for testing, we need to make sure that travis triggers
the rspec tests. This can be done in two ways, either by putting a custom
script name into .travis.yml or by modifying the `rake test` task. I like to
do a combination of both: put `rake travis` into travis.yml and have a specific
task in the Rakefile that can be easily adapted - see https://github.com/htw-imi-wt1wa-ws2015/ruby-learning/blob/master/Rakefile
for an example.

If you haven't integrated rspec yet, you can just redirect `rake travis` to
`rake test` (or do nothing as it has the same effect). All I've done so far
with the tests is to delete everything that failed - leaving a couple of
automatically generated tests which make sure that most of the view can be
rendered, which is a lot already.


## Setup Automatic Deployment to Heroku

Last not least, we're going to combine the two to achieve automatic deployment:
http://docs.travis-ci.com/user/deployment/heroku/

- in Heroku, go to "Manage Account" and generate/show your API Key.
- add this API key to .travis.yml - I ran

     travis encrypt $(heroku auth:token) --add deploy.api_key

make sure `heroku auth:token` works first, which downloads and shows your auth token.

## Adding real tests

We'll use [Capybara](https://github.com/jnicklas/capybara) for automated system
tests: "Capybara helps you test web applications by simulating how a real user
would interact with your app. "

https://github.com/jnicklas/capybara#using-capybara-with-rspec
