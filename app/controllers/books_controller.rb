class BooksController < ApplicationController
  def index
  	@book = Book.new
  	@books = Book.all
    # ↓これ書かないとプロフィール表示エラーになる
    @user = current_user
  end

  def create
  	@book = Book.new(book_params)
  	# ↓@bookをcreateしてるuserは誰か？？というのを紐づける
  	@book.user_id = current_user.id
  	if @book.save
  	   redirect_to book_path(@book.id)
  	else
  	   @books = Book.all
       @user =current_user
  	   render :index
  	end
  end

  def show
    @book = Book.new
  	@user_book = Book.find(params[:id])
    # ↑の投稿者=user  参照スキーマ
    @user = @user_book.user

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
