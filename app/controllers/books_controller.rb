class BooksController < ApplicationController
    before_action :authenticate_user!

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def create
  	book = Book.new(book_params)
    book.user_id = current_user.id
  	book.save
  	redirect_to '/books'

  end

  def edit
    @book_edit = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to '/books'
  end

  def show
  	@book = Book.new
    @book_detail = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end


  private

  	def book_params
  		params.require(:book).permit(:title, :opinion)
  	end

end
