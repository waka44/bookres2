class HomesController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.find(params[:id])
  end
  
  def top
  end
end
