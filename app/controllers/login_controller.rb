class LoginController < ApplicationController
  skip_before_action :authenticate_request

  def defaultAction
    render json: {message: "Welcome to Rails API"}
  end

  def signup
    res = {}
    @email = params[:email]
    @password = params[:password]
    @password_confirmation = params[:password_confirmation]

    user = User.find_by(email: params[:email])

    if user
      render json: { message: "User with #{params[:email]} exists!" }, status: 403
    elsif @password != @password_confirmation
      render json: {message: "Password & Password confirmation do not match"}, status: 406
    else
      user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      if user.save
        render json: {user: user.attributes.slice(*['id', 'email', 'created_at'])}, status: 201
      else
        render json: { errors: [ "Sorry, incorrect email or password" ] }, status: 400
      end
    end
  end

  def authenticate
    res = {}
    email = params[:email]
    password = params[:password]

    command = AuthenticateUser.call(email,password)

    if command.success?
      user = User.find_by(email: email)
      res['user'] = user.attributes
      res['user'].delete('password_digest')
      res['auth_token'] = command.result
      res['msg'] = 'success'
    else
      res['msg'] = "Authentication Failed"
      res['desc'] = "Email/Password incorrect.!!"
    end

    render json: res
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
