class TransactionReturn
    @@returns = []
    def initialize(customer, product, options={})
        # add to stock
        product.stock += 1
        # create customer complaint
        complaint = Complaint.new(customer, product, reason: options[:reason])
        @@returns << self
    end
    def self.all
        @@returns
    end
end
