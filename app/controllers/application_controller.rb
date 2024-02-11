class ApplicationController < ActionController::Base
  helper_method :render_to_string
  skip_forgery_protection
end
