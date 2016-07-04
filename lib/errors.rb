class ToyCityError < StandardError
    def initialize()
        super(message)
    end
end

class DuplicateProductError < ToyCityError
    attr_reader :product

    def initialize(product)
        @product = product
    end

    def message
        "'#{@product.title}' already exists."
    end

end

class OutOfStockError < ToyCityError
    attr_reader :product

    def initialize(product)
        @product = product
    end

    def message
        "'#{@product.title}' is out of stock."
    end
end
