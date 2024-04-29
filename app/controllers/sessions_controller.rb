class SessionsController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: :destroy
  def new
  end

  def create
    user = User.find_by email: params[:email]

    #render plain: params.to_yaml
    if user.authenticate(params[:password])
      # & амперсанд. если выдаст nil то выдаст false
      sign_in user
       flash[:success] = "Welcome back, #{current_user.name_or_email}"
      redirect_to root_path
     else
       flash[:warning] = "Incorrect email and/or password"
      redirect_to new_sessions_path
      #render plain: params.to_yaml
    end
  end

  def destroy
    sign_out
    flash[:success] = "Bye Bye!"
    redirect_to root_path

  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end