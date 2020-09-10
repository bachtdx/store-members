class AuthenticationAdminController < ApplicationController

  def authenticate
    auth_token = AuthenticateAdmin.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token: auth_token)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
