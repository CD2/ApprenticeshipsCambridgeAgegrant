ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def is_logged_in?
    !session[:user_id].nil?
  end

  def login user
    if intergration_test?
      post admin_login_path, params: {session: {email: user.email, password: 'pass123'}}
    else
      session[:user_id] = user.id
    end
  end

  def intergration_test?
    defined?(post_via_redirect)
  end

end
