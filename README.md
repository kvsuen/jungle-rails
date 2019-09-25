# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of learning Rails by example. An existing code base was inherited and then bug fixes, automated testing, and features (admin security, user authentication, UI improvements) were added to the application.

## Final Product

Product Page
!["Product Page"](https://github.com/kvsuen/jungle-rails/raw/master/docs/Products.PNG)

Cart Page
!["Cart Page"](https://github.com/kvsuen/jungle-rails/raw/master/docs/Cart.PNG)

Payment with Stripe
!["Payment"](https://github.com/kvsuen/jungle-rails/raw/master/docs/Payment.PNG)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
