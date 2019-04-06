class UsersController < ApplicationController
    before_action :authenticate_user!

  def index
  	@users = User.all
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])
    @book = Book.new
  end

# UsersControllerからBookクラスを呼び出し。スコープはないのか？

  def edit
    @user = User.find(params[:id])
  end

  def new
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

    def user_params
      params.require(:user).permit(:name, :introduction, :my_image)
    end

end
