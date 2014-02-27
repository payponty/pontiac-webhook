# Pontiac Webhook Engine

[![Gem Version](https://badge.fury.io/rb/pontiac-webhook.png)](http://badge.fury.io/rb/pontiac-webhook)

## Install

Add to Gemfile

    gem 'pontiac'
    gem 'pontiac-webhook'

Start bundle command
    
    $ bundle

## Step 1

Start generator

    $ rails g pontiac client_id client_secret

    $ bundle exec rake db:create db:migrate
    
    $ rails g pontiac_webhook
    
    $ bundle exec rake db:create db:migrate

## Step 2

    $ rails s                     # start server

    $ script/delayed_job start    # start delayed_job server

[http://localhost:3000](http://localhost:3000)
