##Fourth Meal

####Overview

Fourth Meal is the step after the Dinner Dash Project [Dinner Dash](http://tutorials.jumpstartlab.com/projects/dinner_dash.html)
The original tutorial was created by Jumpstart Lab. Fourth Meal [Fourth Meal](http://tutorials.jumpstartlab.com/projects/fourth_meal.html) focuses on taking another group's code, refactoring it and making it applicable for multiple restaurants. 

##[**Craveyard**](http://craveyard.herokuapp.com)

####Instructions

#####Seting Up Locally

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


To Run RSPEC
```ruby
# Run all specs
bundle exec rspec

# Run only model specs
bundle exec rspec spec/models
```


```ruby
rake db:test:load
```

To purge the test database - run

```ruby
rake db:test:purge
```

#####Dependencies
**Amazon AWS S3 Bucket for images**
To integrate the Paperclip gem with image upload on Heroku, we use an AWS S3 bucket to store our images.
You will need to create a bucket (free) on S3, and then export the following keys to your environment:
`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `S3_BUCKET_NAME`

**Stripe for Payment integration**
To integrate credit card payments, we used Stripe. In order for your local copy to process payments correctly, you will
need to sign up for a free Stripe account, visit your account settings, and export the following API keys to your environment: `SECRET_KEY` and `PUBLISHABLE_KEY`

**SendGrid for ActionMailer integration**
To integrate email on account creation and payment success, we use the SendGrid API.
In order for this to function correctly, you must create a SendGrid account, and set your environment variables with the following: `SENDGRID_USERNAME` and `SENDGRID_PASSWORD`.

#####Version in Production
Visit  
