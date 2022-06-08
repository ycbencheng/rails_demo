require 'ffaker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Running the seed file will purge all exisiting data
def setup_db
  purge_db
  seed_db
end

def purge_db
  purge_transactions
  purge_widgets
  purge_users
end

def purge_transactions
  puts 'Purging all transactions'
  Transaction.all.destroy_all
  puts '-----------------'
end

def purge_widgets
  puts 'Purging all widgets'
  Widget.all.destroy_all
  puts '-----------------'
end


def purge_users
  puts 'Purging all users'
  User.all.destroy_all
  puts '-----------------'
end

def seed_db
  create_users
  create_widgets
  create_transactions
end

def create_users
  puts "Creatining new users"

  (1..10).map do |n|
    User.create(first_name: FFaker::Name.first_name,
                last_name: FFaker::Name.last_name,
                email: FFaker::Internet.email,
                deposit_amount: rand(100..1000),
                password: 'password')
  end

  puts '-----------------'
end

def create_widgets
  puts "Creating new widgets"

  users = User.all

  users.each do |user|
    user.widgets.create(title: FFaker::Product.product_name,
                        description: FFaker::FreedomIpsum.paragraph,
                        price: (FFaker::Number.decimal * 4.5).round(2))
  end

  puts '-----------------'
end

def create_transactions
  puts "Creating new transactions"

  users = User.all

  users.each do |user|
    widget = Widget.order('RANDOM()').first

    next if widget.seller_id == user.id

    Transaction.create(seller_id: widget.seller_id,
                       buyer_id: user.id,
                       widget_id: widget.id,
                       amount: widget.price)
  end

  puts '-----------------'
end

setup_db
