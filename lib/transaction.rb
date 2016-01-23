class Transaction
    attr_reader :id, :product, :customer, :transaction_date
    @@id = 1
    @@transactions = []
    def initialize(customer, product, purchase_date)
        @customer = customer
        @product = product
        @product.stock = @product.stock - 1
        @transaction_date = purchase_date
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
        raise TransactionNotFound, "Transaction with id: #{id} was not found."
    end
    def self.all
        @@transactions
    end
end
