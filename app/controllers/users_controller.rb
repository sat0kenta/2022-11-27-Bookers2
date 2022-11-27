class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @newbook = Book.new
    #@user_books = Book.where(user_id: params[:id])
    @books = @user.books
    #@newbook = Book.new
  end



  def edit
    @user = User.find(params[:id])

    redirect_to user_path(current_user.id) if @user.id != current_user.id
  end

  def index
    @newbook = Book.new
    @users = User.all
    @user = current_user
    #@book = @user.books
    #@user = User.find(current_user.id)
    @book = Book.new
  end

  def update
       @user = User.find(params[:id])
       logger.debug(user_params)
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
