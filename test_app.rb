require_relative 'lib/product'
require_relative 'lib/find_by'

@data_path = File.dirname(__FILE__) + "/data/data.csv"
CSV.open(@data_path, "wb") do |csv|
  csv << ["id", "brand", "product", "price"]
end
Product.create(brand: "WhatToys", name: "Apple Plant", price: 5.00)
Product.create(brand: "AhatToys", name: "Apple Plant", price: 7.00)
Product.create(brand: "BhatToys", name: "Apple Plant", price: 8.00)
Product.create(brand: "ChatToys", name: "Apple Plant", price: 9.00)
Product.create(brand: "DhatToys", name: "Apple Plant", price: 11.00)
Product.create(brand: "EhatToys", name: "Apple Plant", price: 12.00)
Product.create(brand: "FhatToys", name: "Apple Plant", price: 13.00)

5.times do
      Product.create(brand: "WalterToys", name: "Sticky Notes", price: 34.00)
    end

Product.create(brand: "ColtToys", name: "Orchid Plant", price: 2.00)

p Product.read_file
p Product.all

Product.destroy(2)

p Product.read_file
p Product.all

# p Product.all

# Product.destroy(7)

# Product.create(brand: "OritToys", name: "Sticky Notes", price: 34.00)

# p Product.all