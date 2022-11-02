json.extract! inventory, :id, :user_id, :item_id, :price, :timestamp, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
