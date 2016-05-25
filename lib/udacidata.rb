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
    all.find {|product| product.id == num}
  end

  def self.destroy(num)
    product_to_delete = find(num)
    db = read_file
    db.delete_if {|product| product[0] == num.to_s}
    write_file(db)
    return product_to_delete
  end

  def self.where(brands={})
    all.find_all {|product| product.brand == brands[:brand]}
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
