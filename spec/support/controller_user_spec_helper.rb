module ControllerUserSpecHelper
  # generate tokens from user id
  def token_generator_user(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  # generate expired tokens from user id
  def expired_token_generator_user(user_id)
    JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  # return valid headers
  def valid_headers_user
    {
        "Authorization" => token_generator_user(user.id),
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