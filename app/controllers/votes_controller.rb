class VotesController < ApplicationController
  #before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end


  # GET /votes/new
  def new
    @vote = Vote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vote }
    end
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
  @vote = Vote.new(vote_params)
  @gif=Gif.find(@vote.gif_id)
    respond_to do |format|
      if @vote.save
        format.js { }
      else
        format.js { }
      end
    end
  end

  def destroy
    @gif=Gif.find(params[:id])
    #@gif.votes_count=@gif.votes_count - 1
    unless @gif.votes.empty?
      @gif.votes.first.destroy
    end
    respond_to do |format|
        if @gif.save
          format.js{}
        end
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_vote
      #@vote = Vote.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:gif_id)
    end
end
