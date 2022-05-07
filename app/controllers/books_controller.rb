class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @books = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
      flash[:notice] = "You have created book successfully."
    else
      @user = current_user
      @books = Book.all
      render:index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @users = User.all
    @user = current_user

  end

  def show
    @booknew = Book.new
    @books = Book.all
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
    if @user == current_user
      render:edit
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
      flash[:notice] = "You have updated book successfully."
    else
      render:edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image, :evaluation)
  end
end
