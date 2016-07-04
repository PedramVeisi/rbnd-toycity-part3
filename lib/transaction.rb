class Transaction

    attr_reader :id, :customer, :product
    @@transaction_count = 0

    def initialize(customer, product)
        @customer = customer
        @product = product
        @@transaction_count += 1
        @id = @@transaction_count

        product.update_stock
    end

end
