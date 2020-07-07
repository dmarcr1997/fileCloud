class SessionsController < ApplicationController
    def new
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
            redirect_to user_path(@user)
        else
            @user = User.new
        end
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            puts 'I cant find that person'
            redirect_to login_path
        end
    end

    def destroy
        session.delete :user_id
        redirect_to login_path
    end

end
