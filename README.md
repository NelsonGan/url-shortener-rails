## Description
This application can shorten any valid urls, similar to bit.ly and tinyurl.com. The application is built with Ruby on Rails and the DBMS used is PostgreSQL.
 
## Deployed URL
The application is deployed with heroku (https://url-shortener-with-rails.herokuapp.com/).

## Installation Guide
1. Make sure that you have Rails and PostgreSQL installed.
2. Clone the repository and cd into it.
3. Run `bundle install` to install all dependencies.
4. Run `rake db:create db:migrate` to create the migration.
5. Run `rails server` to start the application.

## Testing 
The testing suite used is RSpec (https://rspec.info). There are a total of 12 tests, covering both model testing and acceptance testing.

## External Dependencies (Gem)
- Geocoder (http://www.rubygeocoder.com) - to get geolocation of users
- Public Suffix (https://github.com/weppos/publicsuffix-ruby) - to validate url domain

## UI Components
Most ui components used in the application are taken from https://tailwindui.com.

## Screenshots
![home](https://imgur.com/pnAgjcF.png)
![dashboard](https://imgur.com/2FjiJbP.png)
![link](https://imgur.com/qcqKSzL.png)
