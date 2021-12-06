# README

## Dependencies
* Ruby version : 3.0.0
* Rails Version : 6.1.4.1
* Redis : 5.0.7
* Postgresql : 12.9

## Environment Configuration
* Rename .env.example to .env and add values according to your local machine. Current values are set according to docker images.

## Manually Testing APIs
* Import postman collection added at root directory with file name finlink_coding_challenge.postman_collection.json.
* Change postman collection values e.g. parameters or household_token as `Authorization: Bearer your_household_token` as per your local DB values

## Setup with Docker

### Prerequisites

* Docker
* Docker-Compose

## Setup and start the applicaton with docker

### Stop local postgres and redis service to avoid default port conflicts
```
$ sudo service postgresq stop
```
```
$ sudo service redis stop
```
```
$ sudo service redis-server stop
```

### Build docker image
```
$ docker-compose build
```

### Setup database
```
$ docker-compose run web rake db:create db:migrate db:seed
```

### Run the server and sidekiq
```
$ docker-compose up
```

### Run the Test Suit
```
$ docker-compose run web rspec
```

### Run the rubocop
```
$ docker-compose run web rubocop
```

## Setup and start the applicaton without Docker

### Install Dependencies
```
$ gem install bundler && bundle install
```

### Setup database
```
$ rake db:create db:migrate && rake db:seed
```

### Run the server and sidekiq(in another tab)
```
$ rails s
```

```
$ sidekiq
```

### Run the Test Suit
```
$ rspec
```

### Run the rubocop
```
$ rubocop
```

## Future Enhancements
* Using internationalisation gem I18n for translating application to a single custom language.
* Use Faker for creating fake random test data.