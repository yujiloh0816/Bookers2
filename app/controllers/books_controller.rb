class BooksController < ApplicationController
    before_action :authenticate_user!

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def create
  	book = Book.new(book_params)
    book.user_id = current_user.id
  	if book.save
  	 redirect_to '/books' , notice: "Book was successfully created."
    else
      flash[:notice] = "ERROR Book was not created."
      redirect_back(fallback_location: books_path)
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
        redirect_to '/books', notice: "Book was successfully updated."
    else

        # redirect_back(fallback_location: books_path)
        flash.now[:notice] = "ERROR Book was not updated."
        render :edit
        # renderの場合はErrorが起こる。
        # render と redirect_to の違いを理解する必要がある。

    end
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
