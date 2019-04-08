class BooksController < ApplicationController
    before_action :authenticate_user!
    # authenticate_user!メソッド内にどのコントロラーからでも呼び出せるようにしている。gem deviseが生成
    before_action :correct_user, only: [:edit, :update]
    # 原則　同コントロラー内のメソッドを読み込み

  def index
  	@books = Book.all
  	@book = Book.new
    @user = current_user #_leftCol.html用
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
    @user = @book_detail.user #_leftCol.html用
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def correct_user
    # NG      @user = User.find(params[:id])
    # NG      @user = Book.find(params[:id].user_id)
    # NG      @user = Book.find(params[:id]).user_id
    # No bad  @user = Book.find(params[:id]).user
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
      redirect_to books_path
    end
  end

  private

  	def book_params
  		params.require(:book).permit(:title, :opinion)
  	end

end
