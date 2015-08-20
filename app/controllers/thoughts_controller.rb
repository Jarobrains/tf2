class ThoughtsController < ApplicationController
  before_action :check_if_owner, only: [:edit, :update, :destroy]

  def check_if_owner
    @thought = Thought.find(params['id'])
    if current_user.id != @thought.user_id
      redirect_to root_url, notice: "You can't do that"
    end
  end

  def index
    @thoughts = Thought.all
  end

  def show
    @thought = Thought.find(params[:id])
  end

  def new
    @thought = Thought.new
  end

  def create
    @thought = Thought.new
    @thought.user_id = current_user.id
    @thought.update_id = params[:update_id]
    @thought.contents = params[:contents]

    respond_to do |format|
      if @thought.save
        format.html {redirect_to :back, :notice => "Comment created successfully."}
        format.js { render 'create' }
      else
        format.html {render 'new'}
      end
    end
  end

  def edit
    @thought = Thought.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @thought = Thought.find(params[:id])

    @thought.user_id = current_user.id
    @thought.photo_id = params[:photo_id]
    @thought.contents ou= params[:contents]

    respond_to do |format|
      if @thought.save
        format.html {redirect_to thought_url(@thought.id), :notice => "Comment updated successfully."}
        format.js
      else
        format.html {render 'edit'}
        format.js { render 'update_errors'}
      end
    end
  end

  def destroy
    @thought = Thought.find(params[:id])

    @thought.destroy

    respond_to do |format|
      format.html { redirect_to comments_url, :notice => "Comment deleted." }
      format.js { render 'destroy' }
    end
  end
end




