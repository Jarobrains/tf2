class UpdatesController < ApplicationController

 def new
 end

 def index
  @updates = Update.all
  @update = Update.new

  respond_to do |format|
    format.html { render 'index' }
    format.json { render json: @updates}
  end
 end

def show
  @update = Update.find(params[:id])
  @thought = Thought.new
  respond_to do |format|
    format.html
    format.json { render json: @update}
  end
end

end
