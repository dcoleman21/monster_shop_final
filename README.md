# Monster Shop - Bulk Discount

Adds functionality to the [Turing](turing.io) Mod2 BE [final project](https://github.com/turingschool-examples/monster_shop_final).

Merchants can add bulk discount rates for all of their inventory. These apply automatically in the shopping cart, and adjust the order_items price upon checkout.

## Deployment

* [Monster Shop - Bulk Discount](https://monster-shop-final-dani.herokuapp.com/root) Deployed on Heroku
  * Merchant user login credentials:
    * Email: `megan_1@example.com`
    * Password: `securepassword`


## Getting Started

- Fork this repository
- Clone your fork
- Run `rails db:create`
- Run `rails db:migrate`
- Run `rails db:seed`

### Prerequisites

- Run `bundle install`


## Running the tests

- Run `bundle exec rspec`

## Built With

* [Rails](https://rubyonrails.org/) - Framework
* [RSpec](https://github.com/rspec/rspec-rails) - Test suite

## Author

* [**Dani Coleman**](https://github.com/dcoleman21/monster_shop_final)

----------------

# Monster Shop Extensions - Bulk Discount

## Bulk Discount

#### General Goals

Merchants add bulk discount rates for all of their inventory. These apply automatically in the shopping cart, and adjust the order_items price upon checkout.

#### Completion Criteria

1. Merchants need full CRUD functionality on bulk discounts, and will be accessed a link on the merchant's dashboard.
1. You will implement a percentage based discount:
   - 5% discount on 20 or more items
1. A merchant can have multiple bulk discounts in the system.
1. When a user adds enough value or quantity of a single item to their cart, the bulk discount will automatically show up on the cart page.
1. A bulk discount from one merchant will only affect items from that merchant in the cart.
1. A bulk discount will only apply to items which exceed the minimum quantity specified in the bulk discount. (eg, a 5% off 5 items or more does not activate if a user is buying 1 quantity of 5 different items; if they raise the quantity of one item to 5, then the bulk discount is only applied to that one item, not all of the others as well)
1. When there is a conflict between two discounts, the greater of the two will be applied.
1. Final discounted prices should appear on the orders show page.

#### Mod 2 Learning Goals reflected:
- Database relationships and migrations
- Advanced ActiveRecord
- Software Testing
