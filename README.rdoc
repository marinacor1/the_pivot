# Air B'n'Basement

### Authors
[Admir Draganovic](http://github.com/draganovic), [Marina Corona](https://github.com/marinacor1), [Matt Pindell](https://github.com/pindell-matt)

This project was created as a part of the curriculum for the [Turing School of Software & Design](http://turing.io) to complete the "Pivot" project.

The original version of this project, from which this version was pivoted, can be found at: [https://github.com/thompickett/super-coders](https://github.com/thompickett/super-coders)

### Overview

This multi-tenancy Rails application is a fundraising site modeled after Airbnb. Users can browse and rent homes from hosts. Users can become hosts.

### Live Version

You can find a live version of this application on Heroku at: [http://airbnbasement.herokuapp.com/](http://airbnbasement.herokuapp.com/)

### Setup

To set up a local copy of this project, perform the following:

  1. Clone the repository: `https://github.com/marinacor1/the_pivot`
  2. `cd` into the project's directory
  3. Run `bundle install`
  4. Run `rake db:create db:migrate db:seed` to set up the postgres database and seed it with cities, homes and users.
    - The seed includes the setup for a platform administrator. To login as a platform admin, use these credentials - email: jorge@turing.io, password: password.
  5. Run the application in the dev environment by running `rails s`

### App Features

The app is designed for both the mobile and desktop experience. Some of the main features of the app include:

#### Users

Users can rent a bundle of homes once they create an account. This bundle is referred to as a trip. The idea behind allowing users to create trips is so that they can link reservations together if they are traveling to multiple destinations over a period of time.

#### Hosts

To become a host a user can add their home to their profile and once their home is approved by the platform_admin other users can make reservations. A host can add multiple hosts to manage their home but each host may only have one home.

#### Platform Admins

Admins are the 'master user' of the site. A platform admin is the only user who can approve new homes to go active, and view pending homes. This is done via the platform admin dashboard. Platform admins can also act as normal users.

### Test Suite

The test suite tests the application on multiple levels. To run all of the tests, run `rspec` from the terminal in the main directory of the project.

### Dependencies

This application depends on many ruby gems, all of which are found in the `Gemfile` and can be installed by running `bundle install` from the terminal in the main directory of the project.
