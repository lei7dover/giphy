class GifsController < ApplicationController
  def index
    @gifs=Gif.all
    @gif= Gif.new
  end

  def create
    @gif=Gif.new(gif_params)
    respond_to do |format|
      format.js
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
