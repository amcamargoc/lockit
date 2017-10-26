json.extract! recipient, :id, :full_name, :email, :phone_number, :identification, :created_at, :updated_at
json.url recipient_url(recipient, format: :json)
