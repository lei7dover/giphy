class UsersController < ApplicationController
 #before_filter :require_no_user, :only => [:new, :create]
 before_filter :require_user, :only => [:show, :edit, :update]
 before_filter :set_user, only: [:show, :edit, :update]

 def index
   @users=User.all
 end

 def new
   @user = User.new
 end

 def create
   @user = User.new(user_params)
   if @user.save
     respond_to do |format|
       format.html { redirect_to @user, notice: 'User was successfully created.' }
       format.js { }
     end
   else
     respond_to do |format|
       format.js {render 'errors'}
     end
   end
 end

 def show
   @user=User.find(params[:id])
   @gifs=@user.gifs.order("votes_count DESC")
   @vote=Vote.new
 end

 def edit
   @user = @current_user
 end

 def update
 @user = @current_user # makes our views "cleaner" and more consistent
   respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { redirect_to root_path }
        format.json { render js: @user.errors, status: :unprocessable_entity }
      end
    end
 end

 private

  def set_user
    @user=User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email,:login, :password, :password_confirmation)
  end

end
