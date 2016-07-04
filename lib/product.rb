class Product

    attr_reader :title, :price, :stock
    @@products = []

    def initialize(options={}) 
        @title = options[:title] || ''
        @price = options[:price] || 0
        @stock = options[:stock] || 0
        add_new_product
    end

    def self.all
        @@products
    end

    def self.find_by_title(title)
        @@products.each do |product|
            if product.title == title
                return product
            end
        end

        return nil
    end

    def in_stock?
        if @stock != 0
            return true
        else
            return false
        end
    end

    def self.in_stock
        @@products.select {|product| product.in_stock?}
    end

    def update_stock
        @stock -= 1
    end

    def add_new_product
        if self.class.find_by_title(@title)
            raise DuplicateProductError.new(self)
        else
            @@products << self
        end
    end

end
