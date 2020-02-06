class UsersController < ApplicationController

	def index
		@users = User.all
		@user = current_user
		@book = Book.new
	end

	def show
		@user = User.find(params[:id])
		@books = @user.books
		@book = Book.new
	end

	def edit
		@user = User.find_by(id: params[:id])
		if @user.id != current_user.id
			redirect_to user_path(current_user)
		end
	end

	def update
		   @user = User.find_by(id: params[:id])
		if @user.update(user_params)
		   flash[:notice] = "user was successfully updated."
		   redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

	def destroy
		flash[:notice] = "Signed out successfully."
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :introduction, :profile_image)
	end

end
