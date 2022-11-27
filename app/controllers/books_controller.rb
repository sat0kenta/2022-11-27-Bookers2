class BooksController < ApplicationController
  def new
   @book = Book.new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render :index
    end
  end


  def index
   @books = Book.all
   @user = current_user
   @book = Book.new
   @newbook = Book.new
   #@user = @book.user
  end

  def show
   @book = Book.find(params[:id])
   @books = Book.new
   @user = @book.user
  end

  def edit
   @book = Book.find(params[:id])
   redirect_to books_path if @book.user_id != current_user.id
  end


  def back
     @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
      render :edit

    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end



  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
