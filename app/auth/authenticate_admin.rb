class AuthenticateAdmin
  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point
  def call
    JsonWebToken.encode(admin_id: admin.id) if admin
  end

  private

  attr_reader :email, :password

  # verify admin credentials
  def admin
    admin = Administrator.find_by(email: email)
    return admin if admin && admin.authenticate(password)
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end