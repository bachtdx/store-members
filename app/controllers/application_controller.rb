class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  attr_reader :current_user
  attr_reader :current_admin

  private
  # Check for valid request token and return user
  def authorize_request_user
    @current_user = (AuthorizeApiRequestUser.new(request.headers).call)[:user]
  end

  def authorize_request_admin
    @current_admin = (AuthorizeApiRequestAdmin.new(request.headers).call)[:admin]
  end
end
