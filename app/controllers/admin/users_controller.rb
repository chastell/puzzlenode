class Admin::UsersController < Admin::Base

  before_filter :find_user, :only => [:edit, :update, :destroy]

  def destroy
    @user.destroy

    flash[:notice] = 'User sucessfully deleted!'
    redirect_to admin_users_path
  end

  def edit
  end

  def index
    @users = User.all
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User sucessfully updated!'
      redirect_to admin_users_path
    else
      render action: :edit
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

end
