class UpdatesController < ApplicationController

 def new
 end

 def show
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
  @updates = Update.find(params[:id])
  @comment = Comment.new
  respond_to do |format|
    format.html
    format.json { render json: @update}
  end
end

end
