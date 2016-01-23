class Customer
    attr_reader :name, :purchase_date
    @@customers = []
    def initialize(options={})
        @name = options[:name]
        add_to_customers
    end
    def self.find_by_name(search_name)
        for customer in @@customers
            if (customer.name == search_name)
                return customer
            end
        end
    end
    def add_to_customers
        # check for duplicate customer by name
        for customer in @@customers
            if (customer.name == @name)
                raise DuplicateCustomerError, "'#{@name}' already exists."
            end
        end
        @@customers << self
    end
    def self.all
        @@customers
    end
    def purchase(product)
        # check if product is available for purchase
        if (product.in_stock?)
            transaction = Transaction.new(self, product, Time.now)
        else
            raise OutOfStockError, "#{product.title} is out of stock."
        end
    end
    def transactionreturn(product, options={})
        # check if return date hasn't expired
        reason = options[:reason]
        return1 = TransactionReturn.new(self, product, reason: reason)
    end
end
