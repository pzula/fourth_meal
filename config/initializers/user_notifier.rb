if Rails.env.development? || Rails.env.test?
  USER_NOTIFIER = UserNotifierFake
else
  USER_NOTIFIER = UserNotifierEmail
end
