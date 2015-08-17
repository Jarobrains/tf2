class UpdatesController < ApplicationController

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
