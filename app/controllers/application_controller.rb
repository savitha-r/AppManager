class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  def default_url_options
    if Rails.env.development?
      {:host => "http://localhost:3000"}
    end
  end

  def is_valid_email?(string)
  	email = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  	if string.match(email)
  		true
  	else 
  		false
  	end
  end

  
 
  
end
