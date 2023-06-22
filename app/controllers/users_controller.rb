class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    
    @book = Book.new
    @books = Book.all
    @books = @user.books #全体の投稿データを
  end

  def edit
  end
  
  def index
  end
end
