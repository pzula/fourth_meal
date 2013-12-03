###Fourth Meal

####Overview

Fourth Meal is the step after the Dinner Dash Project [Dinner Dash](http://tutorials.jumpstartlab.com/projects/dinner_dash.html)
The original tutorial was created by Jumpstart Lab. Fourth Meal [Fourth Meal](http://tutorials.jumpstartlab.com/projects/fourth_meal.html) focuses on taking another group's code, refactoring it and making it applicable for multiple restaurants. 

####Instructions

#####Setuping Locally

1. Clone the repository.
  `https://github.com/pzula/fourth_meal.git'
2. Move into that directory.
  `cd fourth_meal`
3. Install gem dependencies.
  `bundle install`
4. Make sure you have Postgres installed on your computer.
   We recommend either installing it through the [Postgres.app](http://postgresapp.com/) or [Homebrew](http://russbrooks.com/2010/11/25/install-postgresql-9-on-os-x)
5. Create and seed the database.
   `rake db:create db:seed`
6. Start the Rails sever.
   `rails s`

####Test Version
Running Tests
```ruby
rake test
```

```ruby
rake db:test:load
```

To purge the test database - run

```ruby
rake db:test:purge
```

#####Version in Production
Visit [this heroku site]
