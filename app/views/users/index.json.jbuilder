json.array!(@users) do |user|
  json.extract! user, :user, :password, :password_confirmation, :admin
  json.url user_url(user, format: :json)
end
