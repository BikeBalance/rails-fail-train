class VisitorsController < ApplicationController

  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :phone, :password)
  end

  def client_token
    @client_token ||= Braintree::ClientToken.generate
  end
end
