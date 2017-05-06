# Volunteer Tracker

#### Database Basics Independent Project for Epicodus, 5/5/2017

#### By Monique St. Laurent

## Description

An application for a non-profit, that uses a sql database to allow users to track projects and volunteers.

**User Stories**

* As a non-profit employee, I want to view, add, update and delete projects.
* As a non-profit employee, I want to view, add, update and delete volunteers.
* As a non-profit employee, I want to add volunteers to a project.

## Installation Requirements

* Clone the repository: 'git clone https://github.com/moinstla/volunteer-tracker.git'
* Change to the project directory: 'cd volunteer_tracker'
* Install gems: 'bundle'
* Run the app: 'ruby app.rb'
* In browser, navigate to localhost:4567


### Database Setup

*  Install postgres and start psql
* `CREATE DATABASE volunteer_tracker;`
* `CREATE TABLE projects (id serial PRIMARY KEY, name varchar);`
* `CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, project_id int);`
* `CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;`


## Technologies Used

* Ruby
* Sinatra
* HTML
* CSS
* SQL
* Bootstrap


## License

This software is available under the MIT License Copyright (c) 2017 Monique St. Laurent
