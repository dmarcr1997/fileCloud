class ApplicationController < ActionController::Base
    helper_method :current_user, :require_login
    def current_user
        User.find_by(id: session[:user_id])
    end

    def require_login
        redirect_to login_path, alert: 'Must be Logged in to view this action' if current_user.nil?
    end
end
