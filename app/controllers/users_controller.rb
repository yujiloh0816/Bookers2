class UsersController < ApplicationController
  def index
  	@users = User.all
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
  end

# UsersControllerからBookクラスを呼び出し。スコープはないのか？

  def edit
  end

  def new
  end

end
