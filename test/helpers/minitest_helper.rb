require "minitest/rails/capybara"

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Assertions
end
