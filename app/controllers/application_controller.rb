class ApplicationController < ActionController::Base
  include SessionsHelper

  private
    # ログインしてなければリダイレクト
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url, status: :see_other
      end
    end
end
