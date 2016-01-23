class Customer
    attr_reader :name
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
        # check duplicate product
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
end
