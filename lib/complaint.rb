class Complaint
    @@complaints = []
    def initialize(options={})
        @reason = options[:reason]
        add_to_complaints
    end
    def add_to_complaints
        @@complaints << self
    end
    def all
        @@complaints
    end
end
