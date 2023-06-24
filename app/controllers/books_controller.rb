class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if  @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
   else
     @books = Book.all
     render :index
   end
  end

  def index
    @book = Book.new
    @user = current_user
    
    @books = Book.all
    @users = User.all
  end

   def show
    @newbook = Book.new
    @newuser = current_user
    
    @user = User.find(params[:id])
    @book = @user.books
   end

   def edit
     @book = Book.find(params[:id])
   end

   def update
    book = Book.find(params[:id])
    list.update(book_params)
    redirect_to book_path(book.id)  
   end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

 private
 def book_params
    params.require(:book).permit(:title, :body, :name, :profile_image, :introduction)
 end

end
