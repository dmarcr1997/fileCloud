class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            puts 'I cant find that person'
            redirect_to new_session_path
        end
    end

    def destroy
        session.delete :user_id
        redirect_to new_sessions_path
    end

end
