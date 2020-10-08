class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[home]
  skip_before_action :correct_user, only: %i[home]

  def home
  end
end
