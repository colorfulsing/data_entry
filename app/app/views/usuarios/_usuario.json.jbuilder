json.extract! user, :id, :email, :status, :created_at, :updated_at
json.url usuario_url(user, format: :json)
