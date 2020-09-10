module ControllerAdminSpecHelper
  # generate tokens from user id
  def token_generator_admin(admin_id)
    JsonWebToken.encode(admin_id: admin_id)
  end

  # generate expired tokens from user id
  def expired_token_generator_admin(admin_id)
    JsonWebToken.encode({ admin_id: admin_id }, (Time.now.to_i - 10))
  end

  # return valid headers
  def valid_headers_admin
    {
        "Authorization" => token_generator_admin(administrator.id),
        "Content-Type" => "application/json"
    }
  end

  # return invalid headers
  def invalid_headers_user
    {
        "Authorization" => nil,
        "Content-Type" => "application/json"
    }
  end
end