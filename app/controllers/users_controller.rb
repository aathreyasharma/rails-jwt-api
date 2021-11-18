class UsersController < ApplicationController
  before_action :set_user, only: [:index, :update_infection]

  def index
    user_obj = @user.attributes.slice(*safe_attrs)
    user_obj.merge!({'pincode' => @user.pincode.code})
    render json: user_obj, status: 200
  end

  def safe_attrs
    %w( id email created_at mobile )
  end

  def update_infection
    infected = params[:result] == 'positive'
    @user.infect! if infected

    render json: {updated: infected}
  end

  private

  def set_user
    @user = User.find(params[:id] || params[:user_id])
  end
end
