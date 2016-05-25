module Analyzable
  # Your code goes here!
  def self.count_by_brand(products)
  	products_brands = products.map {|product| product.brand}
  	return attr_times(products_brands)
  end

  def self.count_by_name(products)
  	products_names = products.map {|product| product.name}
  	return attr_times(products_names)
  end

  def self.average_price(products)
  	products_prices = products.map {|product| product.price.to_f}
  	return (products_prices.reduce(:+)/products_prices.length).round(2)
  end

  private

  def self.attr_times(product_attrs)
  	product_attrs_set = product_attrs.uniq
  	attr_times = {}
  	product_attrs_set.each {|attribute|
  		attr_times[attribute] = product_attrs.count(attribute)
  	}
  	return attr_times
  end

end
