class GifsController < ApplicationController
  before_action :set_gif, only: [:show, :edit, :update, :destroy]
  before_filter :require_user, :only => [:show, :edit, :update]

  def index
    @gifs=Gif.all.order("votes_count DESC")
    @gif= Gif.new
    @user=User.new
    @user_session=UserSession.new
    @vote = Vote.new(params[:vote])
  end

  def create
    @gif=Gif.new(gif_params)
    @gif.user=current_user
    if @gif.save
      @gifs=Gif.all.rotate(-1)
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js {render 'errors'}
      end
    end
  end

  def new
    @gif=Gif.new
  end

  def show
   @vote = Vote.new(params[:vote])
  end
  private

  def set_gif
    @gif = Gif.find(params[:id])
    unless @gif.user == @current_user
      flash[:alert]= "You are not the creator of this gif!"
      redirect_to root_url
    end
  end

  def gif_params
    params.require(:gif).permit(:url,:user_id)
  end

end
