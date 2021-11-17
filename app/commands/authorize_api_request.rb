class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers={})
    @headers = headers
  end

  def call
    user
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find(decode_auth_token['user_id']) if decode_auth_token
    @user || errors.add(:token, 'Invalid Token')
  end

  def decode_auth_token
    @decoded_auth_token ||= JWT.decode(http_auth_header, hmac_secret, 'HS256')[0] if http_auth_header
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization']
    else
      errors.add(:token, 'Token Missing')
    end
    nil
  end

  def hmac_secret
    ENV["SECRET_KEY"]
  end
end
