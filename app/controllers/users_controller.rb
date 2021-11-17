class UsersController < ApplicationController
  before_action :set_user, only: :index

  def index
    render json: @user.attributes.slice(*safe_attrs)
  end

  def safe_attrs
    %w( id email created_at )
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
