require_relative 'lib/product'
require_relative 'lib/find_by'

@data_path = File.dirname(__FILE__) + "/data/data.csv"
CSV.open(@data_path, "wb") do |csv|
  csv << ["id", "brand", "product", "price"]
end
Product.create(brand: "WhatToys", name: "Apple Plant", price: 5.00)
Product.create(brand: "AhatToys", name: "Apple Plant", price: 7.00)
Product.create(brand: "BhatToys", name: "Apple Plant", price: 8.00)
Product.create(brand: "WalterToys", name: "Lucky Notes", price: 31.00)
Product.create(brand: "WalterToys", name: "Bucky Notes", price: 32.00)

