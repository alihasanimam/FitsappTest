json.extract! message, :id, :sender, :receiver, :text, :status, :seen_at, :created_at, :updated_at
json.url message_url(message, format: :json)