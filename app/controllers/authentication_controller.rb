class AuthenticationController < ApplicationController

  # return auth token once user is authenticated
  skip_before_action :authorize_request, only: :authenticate
  def authenticate
    auth_token =
      AuthenticateUser.new(auth_params[:username], auth_params[:password]).call
    user = User.where( username: auth_params[:username])
    json_response(auth_token: auth_token, user: user)
  end

  private
  def auth_params
    params.permit(:username, :password)
  end
  
end