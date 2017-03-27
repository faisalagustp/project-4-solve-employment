# README

Boss
- create user (returns us a user id)
- create employer (with user id) -> employer_id
- create job (with employer id)
- view jobs (with employer id)
- edit job (w. job id)
- delete job (w. job id)

Worker
- create another user
- create employee (w user id) -> employee_id
- view jobs
- apply to job (w employee id)
- view jobs (see application status change)

Boss
- view my jobs, see application count increase appropriately
- accept application (w application id)

Worker
- view jobs list (see application status change)




Integrate devise

Add validations

Figure out API authentication (so people can't just submit whatever ids they want)

Deploy This




This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
