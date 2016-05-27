require_relative 'lib/product'
require_relative 'lib/find_by'
require_relative 'lib/analyzable'

@data_path = File.dirname(__FILE__) + "/data/data.csv"
CSV.open(@data_path, "wb") do |csv|
  csv << ["id", "brand", "product", "price"]
end

p1 = Product.create(brand: "AverageBrand", name: "Nyan Cat", price: 15.32)
p2 = Product.create(brand: "AverageBrand", name: "Nyan Cat", price: 18.23)
p3 = Product.create(brand: "AverageBrand", name: "Nyan Cat", price: 11.30)
Product.create(brand: "FindMyBrand", name: "Skateboard", price: "11.30")
Product.create(brand: "Lego", name: "FindMyName", price: "11.30")

p Product.destroy(6)

