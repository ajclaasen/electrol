# Electrol

Electricity usage logging and approval application.

## Prerequisites

- Ruby (3.0.0 was used, but >= 2.5.0 might also work)
- Postgresql (13 was used, but older versions might also work)
- Yarn

## Setup

Run the following commands:
```
$ bundle
$ yarn
```

### Database initialization

Run the following commands:
```
$ rails db:setup
```

## Running the test suite

Run the following command:
```
$ rspec
```

## Running the application

Run the following command:
```
$ rails s
```

The application will be hosted on [`http://localhost:3000`](http://localhost:3000)

You can sign in with the following login credentials:
- Email: `employee@example.com`
- Password: `password`

Or

- Email: `manager@example.com`
- Password: `password`
