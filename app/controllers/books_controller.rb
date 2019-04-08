class BooksController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user,   only: [:edit, :update]

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def create
  	book = Book.new(book_params)
    book.user_id = current_user.id
  	if book.save
  	 redirect_to book_path(book) , notice: "Book was successfully created."
    else
      flash[:notice] = "error Book was not created."
      redirect_back(fallback_location: books_path)
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
        redirect_to book_path(@book), notice: "Book was successfully updated."
    else
        flash.now[:notice] = "error Book was not updated."
        render :edit
    end
  end

  def show
  	@book = Book.new
    @book_detail = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def correct_user
    # @user = User.find(params[:id])
    # @user = Book.find(params[:id].user_id)
    # @user = Book.find(params[:id]).user_id
    @user = Book.find(params[:id]).user
    if @user.id != current_user.id
      redirect_to books_path
    end
  end

  private

  	def book_params
  		params.require(:book).permit(:title, :opinion)
  	end

end
