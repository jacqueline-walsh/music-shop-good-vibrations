json.extract! listing, :id, :title, :artist, :version, :description, :price, :created_at, :updated_at
json.url listing_url(listing, format: :json)
