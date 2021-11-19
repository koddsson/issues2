class ApplicationController < ActionController::Base
  # Turn off CSRF protection. We probably need to enable this again in the future.
  skip_before_action :verify_authenticity_token
end
