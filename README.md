# Money Disbursement for Merchants

## The challenge

Make a system to calculate how much money should be disbursed to each merchant based on the following rules:

- Disbursements are done weekly on Monday.
- We disburse only orders which status is completed.
- The disbursed amount has the following fee per order:
-- 1% fee for amounts smaller than 50 €
-- 0.95% for amounts between 50€ - 300€
-- 0.85% for amounts over 300€

## Requirements:

- Create the necessary data structures and a way to persist them for the provided data. You don't have to follow our schema if you think another one suits better.
- Calculate and persist the disbursements per merchant on a given week. As the calculations can take some time it should be isolated and be able to run independently of a regular web request, for instance by running a background job.
- Create an API endpoint to expose the disbursements for a given merchant on a given week. If no merchant is provided return for all of them.

The notification engine provides different methods that you can use in your controllers to trigger notification for the single or multiple users.


## Tech Stack:

- Ruby version: 3.0.0
- Rails version: ~> 7.0.3
- SQlite3


## Deployment instructions

- Clone the project
- Go to the directory
- Run `bundle install`
- Run `rails db:prepare db:seed`
- Run `rails s` to start rails server

## To Test API

URL: http://localhost:3000/api/disbursements?week=2018-02-16&merchant=info@flatley-rowe.com

This will return disbursements according to the week and merchant and response will look like this:

`{
  "data": [
    {
      "id": 953,
      "fee": 1.79,
      "actual_price": 188.93,
      "disbursed_price": 187.14,
      "week": "2018-02-12",
      "percentage": 0.95,
      "merchant_name": "Flatley-Rowe",
      "order_id": 1188
    },
    {
      "id": 954,
      "fee": 1.3,
      "actual_price": 136.6,
      "disbursed_price": 135.3,
      "week": "2018-02-12",
      "percentage": 0.95,
      "merchant_name": "Flatley-Rowe",
      "order_id": 1189
    }
  ]
}`

## Technical Description:

There are multiple data structures but I'm using tables to persist data because the tables are covering both requirements persisting and efficient. I also write some services and concerns to keep models and controllers clean and used eager loading to extract data from tables to boost the performance.

### Note: 
- I'm using SQlite3 instead of postgres due to shortage of time.
- If you don't need to persist disbursement you need to call just Fee Service like `fee, percentage = Sequra::FeeService.call(order)` it takes order and returns fee and percentage.

# How to run rspec/test cases:
- run this on console for controllers *rspec spec/controllers*
- run this on console for models *rspec spec/models*