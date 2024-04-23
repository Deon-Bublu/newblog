class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:email]
    if user.authenticate(params[:password])
      # & амперсанд. если выдаст nil то выдаст false
      sign_in user
      flash[:success] = "Welcome back, #{current_user.name_or_email}"
      redirect_to root_path
    else
      flash[:warning] = "Incorrect email and/or password"
      redirect_to new_session_path
      #render plain: params.to_yaml
    end
  end

  def destroy
  end
end