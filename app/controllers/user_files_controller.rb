class UserFilesController < ApplicationController
   def new 
        @user_file = UserFile.new
        @folder = Folder.find(params[:folder_id])
   end

   def show
        @user_file = UserFile.find(params[:id])
        send_data @user_file.data, :filename => @user_file.filename, :type => @user_file.content_type
   end

   def create
        return if params[:user_file].blank?
        @folder = Folder.find(params[:folder_id])
        @user = User.find(session[:user_id])
        @user_file = UserFile.new
        @user_file.uploaded_file = params[:user_file]
        @user_file.folder = @folder
        if @user_file.save
            flash[:notice] = "Thank you for your submission"
            redirect_to user_path(@user)
        else
            flash[:error] = "There was a problem submitting your attachment."
            redirect_to new_user_file(@user.id)
        end
    end

    private
    def user_files_params

    end

end
