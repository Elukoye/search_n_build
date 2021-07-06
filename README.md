# Project: Search_and_Build rails API

## Live version of project : [Search_and_Build rails API](https://fast-falls-25301.herokuapp.com/)

## Link to API Documentation: [Search_and_Build rails API](https://documenter.getpostman.com/view/11639084/T17Dg8ox)


## Description
This Ruby on Rails capstone is based on creating API's for selecting tutorials, viewing their details and setting a date on when to build the project.Inspiration for this project was derived from the original capstone project as below: 
**Final Capstone Project [backend-only variant]** is based on an app to book an appointment to try a motorcycle. You will be building an API for this app. You should familiarize yourself with the given design of the website as it is going to be your API client.
![Screenshot (239)](https://user-images.githubusercontent.com/46542515/85428143-71a2e480-b585-11ea-9f23-cc6302bbae6b.png)



## Special rules
Technical mandatory requirements of the project:

- [ ] The database should have at least 2 tables — in this example, motorcycle models and appointments, i.e., the appointments can be accessed by all users unless you implement a proper user authentication (more on this later)
- [ ] Create a user table in your database, so that a given user could only access the objects they created
- [ ] Create endpoints for admin actions: create / update / delete objects (not protected by under "admin" namespace)
- [ ] For the back-end you will use Ruby on Rails
    - [ ] You will create a REST API to manage database resources, in this case, measurements (things to measure could be added manually to the database or from an admin panel)
- [ ] Your API should have a public documentation page similar to this one
   
## Technologies
- [ ] Ruby on Rails
- [ ] Postman
- [ ] RSpec
- [ ] JWT gem

##  API Features
- [ ] The APIs can Create  a user account by typing the username and password
- [ ] Client can use the APIs to create a session to login an existing user
- [ ] The APIs restrict endpoints accessibility for projects and appointments unless the use has been authenticated and has an existing account.
- [ ] The APIs can be used to fetch data for projects and appointments created by a user.

## Added Feature
- [ ] Implemented JWT token authentication for admin action endpoints

## Version 
- [ ] Version 1.0

## Schema
- [ ] This API uses http requests to access its database in the form of a json response

## Environment
- [ ] Ruby on Rails version  6.0.3 and above
- [ ] Ruby version 2.6.5
- [ ] Puma: A Ruby Web Server Built For Concurrency version 4.1
- [ ] To get started with tests, install rails-rspec in your Gemfile 


## Getting started
- [ ] To get started with the app, clone or download the repo :[Clone the repo](https://github.com/Elukoye/search_n_build.git)

## Install the gems: 
- [ ] Run bundle install --without production command in your terminal to install the needed gems in your Gemfile

## Connect to the Database :
- [ ] Run rails db:create

## Migrate the database:
- [ ] Run rails db:migrate to run the migration files

## Start the rails server:
- [ ] Run: rails s to start the sever
- [ ] Type localhost:3000 on your browser(or whatever port you are connected to) to view your app on the browser

## Running RSpec tests:
- [ ] Add rails-rspec to :development group in the gemfile
- [ ] Run bundle install
- [ ] Run rails generate rspec:install to generate boilerplate config files
- [ ] Run rspec command to run the test files
- [ ] If all the tests pass,then start the server
- [Click here for a more details about setting up RSpec in a rails app](https://github.com/rspec/rspec-rails)

## AWS postgres installed but unrecognized?:
- [ ] Run sudo yum install postgresql-server:TO INSTALL POSTGRES SERVER type “ sudo service postgresql initdb” 
      first before starting postgresql server

## Deploy to Heroku: 
- [ ] Add pg gem to your Gemfile
- [ ] Run bundle install
- [ ] Ensure you are on master branch
- [ ] Run Heroku create
- [ ] Deploy with heroku git push master
- [ ] add pg gem to your Gemfile
- [ ] heroku run rake db:migrate to migrate database
- [ ] Run heroku open to visit application in the browser
- [Click here for more details about deploying a rails app to heroku ](https://devcenter.heroku.com/articles/getting-started-with-rails6#add-the-pg-gem)

## Show your support
- [ ] Give a ⭐️ if you like this project!

## 📝 License
* [ ] See [LICENSE.md](https://github.com/Elukoye/search_n_build/blob/master/LICENSE.md) for details.

## Authors

👤 **Author1**
* [ ] [Emogene Lukoye](https://github.com/Elukoye)
