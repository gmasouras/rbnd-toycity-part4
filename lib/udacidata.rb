require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  # Your code goes here!
  create_finder_methods :name, :brand
  @@all=[]

  def self.create(opts=nil)
      database_products = read_file
      check_database_ids = database_products.map {|product| product[0].to_s}
      check_product_id = opts[:id].to_s

      if check_database_ids.include?(check_product_id)
        product = new opts
        return product
      else
        product = new opts
        database_products << [product.id, product.brand, product.name, product.price]
        write_file(database_products)
        return product
      end
  end

  def self.all
    @@all.clear
  	read_file[1..-1].each {|line|
      product = new(id: line[0], brand: line[1], name: line[2], price: line[3])
      @@all << product
    }
    @@all
  end

  def self.first(*num)
    num.empty? ? all.first : all.first(num[0])
  end

  def self.last(*num)
    num.empty? ? all.last : all.last(num[0])
  end

  def self.find(num)
    product = all.find {|product| product.id == num}
    if product.nil? 
      begin
        raise ProductNotFoundError,"Given id does not exist"
      rescue ProductNotFoundError => pnfe
        p pnfe.message
        p pnfe.backtrace
      end
    else product
    end
  end

  def self.destroy(num)
    product_to_delete = find(num)
    db = read_file
    db.delete_if {|product| product[0] == num.to_s}
    write_file(db)
    return product_to_delete
  end

  def self.where(products={})
    all.find_all {|product| product.send(products.keys[0].to_s) == products[products.keys[0]]}
  end

  def update(opts={})
    db = self.class.read_file
    self.name = opts[:name] if opts.has_key? :name
    self.brand = opts[:brand] if opts.has_key? :brand
    self.price = opts[:price].to_s if opts.has_key? :price
    db.find {|product| product[0] == self.id.to_s}.replace([self.id, self.brand, self.name, self.price])
    self.class.write_file(db)
    return self
  end

  private

  def self.read_file
  	file = File.dirname(__FILE__) + "/../data/data.csv"
    before = CSV.read(file)
  end

  private

  def self.write_file(after)
  	file = File.dirname(__FILE__) + "/../data/data.csv"
    CSV.open(file,"wb") do |csv|
      after.each { |row|
        csv << [row[0], row[1], row[2], row[3]]
      }
    end
  end

end
