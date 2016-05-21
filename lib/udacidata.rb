require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  # Your code goes here!
  @@all = []

  def self.create(opts={})
      database_products = read_file
      check_database = database_products.map {|product| [product[1], product[2], product[3]]}
      check_product = [opts[:brand], opts[:name], opts[:price].to_s]

      if check_database.include? check_product
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
  	read_file[1..-1].each {|line|
      product = create(id: line[0], brand: line[1], name: line[2], price: line[3])
      @@all << product
    }
    @@all
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
