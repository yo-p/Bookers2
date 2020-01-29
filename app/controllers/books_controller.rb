class BooksController < ApplicationController

	def top
	end

	def index
		@books = Book.all
		@book = Book.new
	end

	def new
	end


	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		#@book = current_user
		if @book.save
		   flash[:notice] = "You have creatad book successfully."
		   redirect_to book_path(@book)
		else
			render :index
		end
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		book = Book.find(params[:id])
		book.update(book_params)
		redirect_to book_path
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end


	private
	def book_params
		params.require(:book).permit(:title, :body)
	end

end
