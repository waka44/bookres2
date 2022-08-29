class UsersController < ApplicationController
  
  # def create
  #   @use =User.new(user_params)
  #   if @user.save
  #     redirect_to user_path(@user.id)
  #   else
  #     render :new
  #   end  
  # end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
      redirect_to user_path(@user.id), notice:"You have updated user successfully."
    else
      render :edit
    end
  end
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end
  
  private
  
  def ensure_user
    @users = current_user.posts
    @user = @posts.find_by(id: params[:id])
    redirect_to new_post_path unless @user
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
