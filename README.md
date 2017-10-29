# Spanglish Dictionary
A full-stack web application ebracing a broken mix of Spanish and English spoken wherever you see Latinos these days. Allowing users to share the slang they have been around their entire lives. 

![Spanglish Definition](https://github.com/edgarsbarajas/spanglishdictionary/blob/master/lib/screenshots/spanglish-definition.png)

## Features
### A user interface
![iPhone and Mac Mockup](https://github.com/edgarsbarajas/spanglishdictionary/blob/master/lib/screenshots/main-screenshot.png)

### User authorization
![User auth](https://github.com/edgarsbarajas/spanglishdictionary/blob/master/lib/gifs/user_auth.gif)


### User commenting and voting
![User voting and commenting](https://github.com/edgarsbarajas/spanglishdictionary/blob/master/lib/gifs/voting_and_commenting.gif)

### User submitted definitions
![User submitting words](https://github.com/edgarsbarajas/spanglishdictionary/blob/master/lib/gifs/submitting.gif)

### Words filtered by user
![User filtered words](https://github.com/edgarsbarajas/spanglishdictionary/blob/master/lib/gifs/user_filtered.gif)

## Technologies Used
### Languages:
* HTML
* CSS
* JavaScript
* Ruby on Rails
* PostgreSQL

### Frameworks/Libaries:
* AJAX
* jQuery

### Gems/APIs:
* [Devise](https://github.com/plataformatec/devise)
* [Faker](https://github.com/stympy/faker)

## Ruby version

* Built using Ruby 2.3.0 and Rails 5.1.4

## System dependencies

* macOS version (~> 10.12.6)

* bundler

* Ruby 2.3.0

* Rails 5.1.4

* PostgreSQL 9.6.3

## Configuration

    $ git clone https://github.com/edgarsbarajas/spanglishdictionary.git

    $ cd spanglishdictionary

    $ bundle install

    $ rails db:setup

    $ rails server

## Database

The website uses a Postgres database

* postgres (PostgreSQL) 9.6.3

### Database creation

    $ rails db:create

### Database initialization

    $ rails db:migrate

    $ rails db:seed

### Database schema

![DB schema](https://github.com/edgarsbarajas/spanglishdictionary/blob/master/schema.png)

## License

Spanglish Dictionary is released under the [MIT License](https://opensource.org/licenses/MIT).
