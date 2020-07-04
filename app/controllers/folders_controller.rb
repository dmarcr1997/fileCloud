class FoldersController < ApplicationController
    def new
        @user = User.find(params[:user_id])
        @folder = Folder.new
    end

    def index
        @user = User.find(params[:user_id])
        @folders = @user.folders
    end

    def show
        @folder = Folder.find_by(id: params[:id])
        @user = User.find_by(id: params[:user_id])
        @files = @folder.user_files
    end

    def create
        @folder = Folder.create(folder_params)
        @user = User.find_by(id: folder_params[:user_id])
        @user.folders << @folder
        redirect_to user_folder_path(@user, @folder)
    end

    def destroy
        raise params
    end

    private
    def folder_params
        params.require(:folder).permit(:name, :user_id)
    end
end
