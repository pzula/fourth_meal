json.array!(@visitor_users) do |visitor_user|
  json.extract! visitor_user, :id, :email
  json.url visitor_user_url(visitor_user, format: :json)
end
