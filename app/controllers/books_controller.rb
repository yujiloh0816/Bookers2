class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
  end

  def create
  	book = Book.new(book_params)
  	book.save
  	redirect_to '/books'

  end

  def edit
  end

  def show
  	@book = Book.new
  end

  private

  	def book_params
  		params.require(:book).permit(:title, :opinion)
  	end

end
