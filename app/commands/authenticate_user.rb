class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    token(user.id) if user
  end

  def hmac_secret
    ENV["SECRET_KEY"]
  end

  def token(user_id)
    payload = {user_id: user_id}
    JWT.encode(payload, hmac_secret, 'HS256')
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by(email: email)
    return user if user && user.authenticate(password)
    errors.add :user_authentication, 'Invaild credentials'
    nil
  end
end
