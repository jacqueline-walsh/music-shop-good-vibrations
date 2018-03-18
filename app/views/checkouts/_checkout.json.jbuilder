json.extract! checkout, :id, :street, :town, :county, :country, :created_at, :updated_at
json.url checkout_url(checkout, format: :json)
