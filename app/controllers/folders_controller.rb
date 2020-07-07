class FoldersController < ApplicationController
    before_action :require_login 
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
        @folder = Folder.find_by(id: params[:folder_id])
        @user = User.find_by(id: params[:user_id])
        @folder.user_files.delete_all
        Folder.delete(@folder)
        redirect_to user_folders_path(@user) 
    end

    private
    def folder_params
        params.require(:folder).permit(:name, :user_id)
    end
end
