class Product
    attr_reader :title, :price
    attr_accessor :stock
    @@products = []
    def initialize(options={})
        @title = options[:title]
        @price = options[:price]
        @stock = options[:stock]
        add_to_products
    end
    def self.all
        @@products
    end
    def add_to_products
        # check for duplicate product by title
        for product in @@products
            if (product.title == @title)
                raise DuplicateProductError, "#{@title} already exists."
            end
        end
        @@products << self
    end
    def self.find_by_title(search_title)
        for product in @@products
            if (search_title == product.title)
                return product
            end
        end
    end
    def in_stock?
        @stock > 0
    end
    def self.in_stock
        products_in_stock = []
        for product in @@products
            if (product.in_stock?)
                products_in_stock << product
            end
        end
        products_in_stock
    end
end
