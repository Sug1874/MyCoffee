class StaticPagesController < ApplicationController
  def home
    if !logged_in?
      redirect_to "/login"
    else
      user_id = current_user.id
      redirect_to "/users/#{user_id}"
    end
  end
end
