class Transaction

    attr_reader :id, :customer, :product
    @@transactions = []
    @@transaction_count = 0

    def initialize(customer, product)
        @customer = customer
        @product = product
        @@transaction_count += 1
        @id = @@transaction_count
        @@transactions << self

        product.update_stock
    end

    def self.all
        return @@transactions
    end

    def self.find(id)
        @@transactions.each do |transaction|
            if transaction.id == id
                return transaction
            end
        end
        return nil
    end


end
