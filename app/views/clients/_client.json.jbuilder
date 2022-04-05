json.extract! client, :id, :name, :email, :profession, :created_at, :updated_at
json.url client_url(client, format: :json)
