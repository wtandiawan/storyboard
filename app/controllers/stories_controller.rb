class StoriesController < ApplicationController
  before_action :signed_in_user, only: [:create, :new, :destroy]
  
  def index
    redirect_to root_path
  end
   
  def create
    @story = current_user.stories.build(story_params)
    if @story.save
      flash[:success] = "Story created!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def destroy
  end

  def new
    @story = Story.new
  end
  
  def show
    @story = Story.find(params[:id])
    @user = User.find(@story.user_id)
    @conditon = ""
  end

  private
    def story_params
      params.require(:story).permit(:content, :title)
    end
end
