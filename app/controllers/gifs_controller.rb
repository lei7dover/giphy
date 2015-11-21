class GifsController < ApplicationController
  def index
    @gifs=Gif.all
    @gif= Gif.new
    @user=User.new
  end

  def create
    @gifs=Gif.all
    @gif=Gif.new(gif_params)
    if @gif.save
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js {flash[:alert]= "Sorry, Your gif didn't safe!"}
      end
    end
  end

  def new
    @gif=Gif.new
  end

  private

  def gif_params
    params.require(:gif).permit(:url,:user_id)
  end

end
