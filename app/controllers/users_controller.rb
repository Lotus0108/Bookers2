class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render:edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
      flash[:notice] = "You have updated user successfully."
    else
      render:edit
    end
  end

  def create
    flash[:success] = "Signed in successfully."
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
