class SessionsController < ApplicationController
  skip_before_action :require_login!, only: %i[new create]
  skip_before_action :correct_user!, only: %i[new create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email or password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
