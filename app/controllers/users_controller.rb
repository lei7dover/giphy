class UsersController < ApplicationController
 before_filter :require_no_user, :only => [:new, :create]
 before_filter :require_user, :only => [:show, :edit, :update]

 def new
   @user = User.new
 end

 def create
   @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.js { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.js { render js: @user.errors, status: :unprocessable_entity }
      end
    end
 end

 def show
   @user = @current_user
 end

 def edit
   @user = @current_user
 end

 def update
 @user = @current_user # makes our views "cleaner" and more consistent
   respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to account_url, notice: 'User was successfully updated.' }
        format.js { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.js { render js: @user.errors, status: :unprocessable_entity }
      end
    end
 end

 private

  def set_user
    @user=User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation, :email)
  end

end
