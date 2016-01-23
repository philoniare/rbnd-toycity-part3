class Transaction
    attr_reader :id, :product, :customer, :purchase_date
    @@id = 1
    @@transactions = []
    def initialize(customer, product, purchase_date)
        @customer = customer
        @product = product
        @product.stock = @product.stock - 1
        @purchase_date = purchase_date
        @id = @@id
        @@transactions << self
        @@id += 1
    end
    def self.find(id)
        for transaction in @@transactions
            if(transaction.id == id)
                return transaction
            end
        end
    end
    def self.all
        @@transactions
    end
end
