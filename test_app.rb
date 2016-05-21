require_relative 'lib/product'

@data_path = File.dirname(__FILE__) + "/data/data.csv"

CSV.open(@data_path, "wb") do |csv|
  csv << ["id", "brand", "product", "price"]
end

5.times do
  Product.create(brand: "WalterToys", name: "Sticky Notes", price: 34.00)
	end

product = Product.create(brand: "ColtToys", name: "Orchid Plant", price: 2.00)


array_of_products = Product.all