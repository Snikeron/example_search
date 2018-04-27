# Step By Step
### New App
```
rails new example_search --database=postgresql
```
### config > database.yml
change database names for development, test, production
### Create DB & install Rspec
```
rails db:create
```
Add rspec-rails gem into GEMFILE
```
bundle i

rails g rspec:install
```
### Create Product Scaffold
```
rails g scaffold Product name price:decimal description:text image_data:text
```
### Create DB seed
```ruby
products = [
    {
        name: "Bread",
        description: "It's a simple carb.",
        price: 500
    },
    {
        name: "Bananas",
        description: "Lots of magnesium packed into a tube.",
        price: 350
    },
    {
        name: "Canned Tuna",
        description: "Responsibly sourced meat in a can.",
        price: 200
    },
    {
        name: "Chocolate Bar",
        description: "Fatty fat fat fat fatty fat.",
        price: 400
    },
    {
        name: "Gummy Bears",
        description: "Keep chewing away, lose them teeth.",
        price: 500
    },
    {
        name: "Microwaveable Buffalo Wings",
        description: "Great for a night out. At home.",
        price: 1500
    },
    {
        name: "Chicken Stock",
        description: "Whip up a great meal with the power of the cube.",
        price: 650
    },
    {
        name: "Beef Stock",
        description: "Beefy beef beef. Great for sauces.",
        price: 650
    },
    {
        name: "Vegetable Stock",
        description: "Vegetarians have great taste. Bless 'em.'",
        price: 650
    },
    {
        name: "Pork Sausages",
        description: "Chuck 'em on the barbie.",
        price: 1000
    }
]

Product.create!(products){ |product| p product.name }
```
```
rails db:migrate

rails db:seed
```
### Create Search Form at Product Index page
```ruby
<%= form_with scope: :products, method: :get do |f| %>
  <%= f.label :search_product_name %>
  <%= f.text_field :search %>
  <%= f.button :search %>
<% end %>
```
This is an arbitrary form with a GET method -- will be doing POST soon.
If you inspect form element at this stage you'll see:
```html
<form action="/products" accept-charset="UTF-8" data-remote="true" method="get"><input name="utf8" type="hidden" value="✓">
  <label for="products_search_product_name">Search product name</label>
  <input type="text" name="products[search]">
  <button name="button" type="submit">search</button>
</form>
```
The form action gets the route '/products'

### Write the Search Logic into the Controller Action 'products#index'
```ruby
def index
  unless params[:products][:search].present?
    @products = Product.all
  else
    product_name = params[:products][:search]
    # Is essentially querying this:
    # {
    #   products: {
    #     search: 'blablabla'
    #   }
    # }
    @products = Product.where(name: product_name)
  end
end
```

### Write the Search Function into the Product Model
```ruby
class Product < ApplicationRecord
    def self.search_by_name(search)
        # where(name: product_name) Time to put some SQL to use
        where("LOWER(name) LIKE ?", "%#{search.downcase}%")
        # NOT where("name LIKE #{search}") --> SQL injection - vulnerable
    end
end
```

