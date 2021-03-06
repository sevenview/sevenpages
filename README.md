Sevenpages
==========

An experiment in content management

Installation
------------

Add the following to your `Gemfile`

```
gem 'sevenpages', git: 'git://github.com/sevenview/sevenpages.git'
```

and update with Bundler

```
$ bundle install
```

### Install the migrations

```
rake sevenpages:install:migrations
rake db:migrate
```

### Configure Routes

Add the following to your `config/routes.rb` file

```
mount Sevenpages::Engine, at: '/sevenpages'
```

And this route, which must be the last route:

```
get ':slug', to: 'sevenpages/public/pages#show', as: :page
```

### Configure CarrierWave uploads

Configure environment variables for your S3 authorization:

```
$ heroku config:add S3_ACCESS_KEY=yourkey S3_SECRET_KEY=yoursecret
$ heroku config:add S3_BUCKET_NAME=yourbucketname
```

Add `carrierwave.rb` to your `config/initializers` directory with something like this:

```
CarrierWave.configure do |config|
  case Rails.env
    when 'production', 'staging'
    config.storage = :fog
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: ENV['S3_ACCESS_KEY'],
        aws_secret_access_key: ENV['S3_SECRET_KEY']
    }
    config.fog_directory = "{{your bucket name}}"
    config.fog_public    = true

    when 'test'
    config.storage = :file
    config.enable_processing = false

    when 'development'
    config.storage = :file
  end
end
```

### Create a User
```
$ rails console
> Sevenpages::User.create(email: 'email@example.org', password: 'uniquepassword')
```

Now you can navigate to the Sevenpages admin at `http://yourapp/sevenpages` and login with the account you created.


Add Devise Routes
-----------------


Configuration
-------------

Create a file called `sevenpages.rb` in `config/initializers`

Currently supported configuration options:

Param                      | Value
:--------------------------| :-----------------------------------------
Sevenpages.reserved_slugs  |['array', 'of', 'reserved', 'slug-names']
