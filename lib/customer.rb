class Customer

    attr_reader :name
    @@customers = []

    def initialize(options = {})
        @name = options[:name] || ''
        @@customers << self
    end

    def self.all
        @@customers
    end

    def self.find_by_name(name)
        @@customers.each do |customer|
            if customer.name == name
                return customer
            end
            return nil
        end
    end

    def purchase(product)
        if product.in_stock?
            Transaction.new(@name, product)
        else
          raise OutOfStockError.new(product)  
        end
    end

end
