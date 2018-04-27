class Product < ApplicationRecord
    def self.search_by_name(search)
        # where(name: product_name) Time to put some SQL to use
        where("LOWER(name) LIKE ?", "%#{search.downcase}%") # makes search case-insensitive
        # NOT where("name LIKE #{search}") --> SQL injection - vulnerable
    end
end
