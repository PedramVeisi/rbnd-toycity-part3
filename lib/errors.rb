class ToyCityError < StandardError
    def initialize()
        super(message)
    end
end

class DuplicateProductError < ToyCityError
    attr_reader :product_title

    def initialize(title)
        @product_title = title
    end

    def message
        "'#{@product_title}' already exists."
    end

end

class DuplicateCustomerError < ToyCityError
    attr_reader :customer

    def initialize(name)
        @customer_name = name
    end

    def message
        "'#{@customer_name}' already exists."
    end
end

class OutOfStockError < ToyCityError
    attr_reader :product_title

    def initialize(title)
        @product_title = title
    end

    def message
        "'#{@product_title}' is out of stock."
    end
end
