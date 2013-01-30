Sevenpages
==========

An experiment in content management

Installation
------------

Add the following to your `Gemfile`

```
gem 'sevenpages', git: 'git://github.com/Sevenview/sevenpages.git'
```

Install the migrations

```
rake sevenpages:install:migrations
rake db:migrate
```

Add the following to your `config/routes.rb` file

```
mount Sevenpages::Engine => "/sp-admin"
```

And this route, which must be the last route:

```
get ':slug', to: 'sevenpages/public/pages#show', as: :page
```

Add Compass and Foundation to your host app `Gemfile`

** Not sure why this is required but for now it's necessary*

```
group :assets do
  gem 'compass'
  gem 'zurb-foundation'
end
```

Now you can navigate to the Sevenpages admin at `http://yourapp/sp-admin`

Add Devise Routes
-----------------


Configuration
-------------

Create a file called `sevenpages.rb` in `config/initializers`

Currently supported configuration options:

Param                      | Value
:--------------------------| :-----------------------------------------
Sevenpages.reserved_slugs  |['array', 'of', 'reserved', 'slug-names']
