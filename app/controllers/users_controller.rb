class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    
    @book = Book.new
    @books = Book.all
    @books = @user.books #全体の投稿データを
  end

  def edit
    @user = User.find(params[:id])
    @book = Book.new
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
    @user = current_user
  end
  
  def index
  end
end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :title, :body, :introduction)
  end