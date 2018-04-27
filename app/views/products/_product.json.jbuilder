json.extract! product, :id, :name, :price, :description, :image_data, :created_at, :updated_at
json.url product_url(product, format: :json)
