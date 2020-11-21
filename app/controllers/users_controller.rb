class UsersController < ApplicationController
  def show
    user_id = params[:id]
    @user = User.find(user_id)
    @books = Book.where(user_id: user_id)
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'Update user info successfully'
    else
      flash.now[:alert] = @user.errors.full_messages
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
