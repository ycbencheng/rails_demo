# Project

## Description

This is to show case my skills and experience as a developer. I created this project with Ruby on Rails 6 and using Slim to display data on the front end. Due to the time contraint, I'm able to complete the objectives below with minimal tests.

The project represent a mock marketplace allowing users to create widgets to buy and sell.

Link to the requirement https://drive.google.com/file/d/1TNslZl23uK96vOUWE07UShTmWI_Ix8Hb/view?usp=sharing

Link to the project management board https://www.notion.so/ycbencheng/Citybase-s-Assignment-eee850ef042a4a269f4a733047f95c7d

## Objectives

- [x] Visitor is able to create a new account (user)
- [x] Each purchase transaction will update the seller and buyer's funding
- [x] Transaction will not go through if the amount is higher than the user's current deposit amount
- [x] Each transaction includes the cost 5% feed
- [x] Record each transaction fee as revenue in the marketplace table

Users can ...

- [x] update, and delete their own account
- [x] sign in and sign out of the their own account
- [x] create a new widget
- [x] upadte and delete their own widget
- [x] top up their funding
- [x] purchase other users' widget
- [x] view their own previous transactions

## Install

### Clone the repository

```shell
git clone https://github.com/ycbencheng/rails_demo.git
cd rails_demo
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.7.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.7.2
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

### Set environment variables

Contact the developer: [ycbencheng@gmail.com] (sensitive data if needed).

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

## Serve

```shell
rails s
```

## Test

```shell
rails test
```
