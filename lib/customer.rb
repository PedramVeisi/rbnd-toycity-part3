class Customer

    attr_reader :name
    @@customers = []

    def initialize(options = {})
        @name = options[:name] || ''
        add_new_customer
    end

    def self.all
        @@customers
    end

    def self.find_by_name(name)
        @@customers.each do |customer|
            if customer.name == name
                return customer
            end
        end
        return nil
    end

    def add_new_customer
        if self.class.find_by_name(@name)
           raise DuplicateCustomerError.new(@name)
        else
           @@customers << self
        end
    end

    def purchase(product)
        if product.in_stock?
            Transaction.new(@name, product)
        else
          raise OutOfStockError.new(product.title)  
        end
    end

end
