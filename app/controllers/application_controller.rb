class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  ActionController::Parameters.permit_all_parameters = true

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: {message: "Unauthorized Request"}, status: :unauthorized unless @current_user
  end



  # def client_has_valid_token?
  #   !!current_user_id
  # end

  # def current_user_id
  #   begin
  #     token = request.headers["Authorization"]
  #     decoded_array = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
  #     payload = decoded_array.first
  #   rescue #JWT::VerificationError
  #     return nil
  #   end
  #   payload["user_id"]
  # end

  # def require_login
  #   render json: {error: 'Unauthorized'}, status: :unauthorized if !client_has_valid_token?
  # end

end
