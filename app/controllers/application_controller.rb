class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :require_login

  private

  def require_login
    if !logged_in?
      flash[:danger] = 'ログインが必要です'
      redirect_to root_path
    end
  end
end
