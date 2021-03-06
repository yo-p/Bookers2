class BooksController < ApplicationController


	def top
	end

	def about
	end

	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
	end

	def new
	end


	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		#@book.user_id = current_user.id
		#@book = current_user
		if @book.save
		   flash[:notice] = "You have creatad book successfully."
		   redirect_to book_path(@book)
		else
		   @user = current_user
		   @books = Book.all
		   render :index
		 end
	end

	def show
		@book_new = Book.new
		@book = Book.find(params[:id])
		@user = @book.user
	end

	def edit
		@book = Book.find(params[:id])
	 if @book.user_id != current_user.id
	 	redirect_to books_path
	 end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
		   flash[:notice] = 'Book was successfully created.'
		   redirect_to book_path(@book)
		else
			#@book = Book.find(params[:id])
			render :edit
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end


	private
	def book_params
		params.require(:book).permit(:title, :body, :user_id)
	end

end
