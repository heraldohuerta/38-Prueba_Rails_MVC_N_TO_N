json.extract! list, :id, :nombre, :titulo, :detalle, :url, :created_at, :updated_at
json.url list_url(list, format: :json)
