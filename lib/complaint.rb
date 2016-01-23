class Complaint
    attr_reader :id
    attr_accessor :reason
    @@id = 1
    @@complaints = []
    def initialize(customer, product, options={})
        @customer = customer
        @product = product
        @reason = options[:reason]
        @id = @@id
        add_to_complaints
        @@id += 1
    end
    def add_to_complaints
        @@complaints << self
    end
    def self.all
        @@complaints
    end
    def self.find(id)
        for complaint in @@complaints
            if(complaint.id == id)
                return complaint
            end
        end
    end
end
