class Module
  
  def create_finder_methods(*attributes)
    # Your code goes here!
    # Hint: Remember attr_reader and class_eval
    attributes.each { |attribute|
      attribute_method = %Q{
            def self.find_by_#{attribute}(val)
              all.find {|product| 
                product.#{attribute}==val
              }
            end
      }
      class_eval(attribute_method)
    }
  end
end
