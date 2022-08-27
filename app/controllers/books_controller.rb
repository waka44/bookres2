class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to User_path(user_params[:id])
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.index
  end
  
  def index
    @user = current_user
    @book = Book.new
  # @books = Book.edit
  end
  
  def destroy
    @book = Books.find(params[:id])
    books.destroy
    redirect_to '/books'
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
