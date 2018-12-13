# README

The problem statement is under `/docs` directory. Please go through it.


## Outline
* Ruby: 2.5.1
* Rails: 5.2.2
* Database: SQLite 3
* Authentication: Devise
* CSS: Bootstrap 4
* API: Grape with Swagger UI
* Background Jobs: Sidekiq
* Reports Exported: CSV
* Mailer: Letter Opener(Development)

## Setup
The database is already having the database, but if you would like to create your own then do the following after cloning:
```
# the ruby verion and gemset are set, you might probably have to install rvm

$ rvm use 
$ bundle
$ rails db:create ; rails db:migrate
$ rails db:seed

# by default it will create about 8 transactions under each card, but if you need more then please run the seeds command more times
```

## Application Details
* Goto http://localhost:3000 and click Admin or Employee and then login with the following:
  * Amdin: admin@zaggle.com/password
  * Employee: employee_1@zaggle.com/password
* Admin can create or assign a card to employee through `/cards` tab
* Admin can view the transactions under `/transactions` tab
  * Admin can use various filters to get the monthly reports of transactions based on employee,  card type
  * Admin can export the transactions by clicking `Export to CSV`, which create a csv in a background job. And, once ready an email is sent with a download link. Letter opener in dev env
* Employee has only 2 options to either view their profile or check transactions through `/transactions` tab. The options here are almost the same with few restrictions.
* The authorization is achieved by spliting the Routes, Controllers and Views for Admin and Employee.

## API
* Grape API is used along with Swagger for API. Goto http://localhost:3000/docs to view the API endpoints
* Currently there are only 3 endpoints:
  * POST - /api/v1/transaction - creates a transaction
  * GET - /api/v1/transactions - fetches a transaction
  * GET - /api/v1/transactions_on_card - fetches all the transactions on a given card

## Relations
* Please check the `/docs` directory in the application to view the entity relation diagram

NOTE: The scope of application is decent, but I have worked only on basic functionalities. The application can further be extended to much more detaling.