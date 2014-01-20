class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  class NotFound < StandardError
  end

  rescue_from NotFound, :with => :custom_error
 
  def default_url_options
    if Rails.env.development?
      {:host => "http://localhost:3000"}
    end
  end

  # why is it here? is it part of ApplicationController?
  # you can always ask if this method has anything to do with request
  # if not, it's probably not part of this class.
  # This is Single Responsibility Principle (SRP)
  def is_valid_email?(string)
  	email = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  	if string.match(email)
  		true
  	else 
  		false
  	end
  end

  def get_entity entity
  	raise NotFound unless entity.present?
    return entity
  end

  def custom_error
  	render "public/404", :status => 404
  end

  
end


