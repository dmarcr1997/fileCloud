class UsersController < ApplicationController
    before_action :require_login, only: [:show] 
    def new
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
            redirect_to user_path(@user)
        else
            @user = User.new
        end
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            puts "Invalid Entry"
            redirect_to new_user_path
        end
    end

    def show
        @user = User.find(params[:id])
    end
        

    private
    def user_params
        params.require(:user).permit(:name, :password)
    end
end
