require 'faker'

# This file contains code that populates the database with
# fake data for testing purposes

def db_seed
  # Your code goes here!
  10.times {
  	Product.create(brand: Faker::Commerce.department, name: Faker::Commerce.product_name, price: Faker::Commerce.price)
  }
end
