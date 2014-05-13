class StoriesController < ApplicationController
  before_action :signed_in_user, only: [:create, :new, :destroy]
  
  def index
    redirect_to root_path
  end
   
  def create
    @story = current_user.stories.build(story_params)
    @story[:like] = 0
    @story[:dislike] = 0
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

  def like
    @storyid = params[:id] 
    @story = Story.find(params[:id])
    if !signed_in?
      flash[:warning] = "You have to be signed in to vote!"
      redirect_to @story
    else
      #check if current_user has voted
      @votedstory = VotedStory.find_by_user_id_and_story_id(current_user.id,@storyid)
      if @votedstory == nil
        @story[:like] = @story[:like]+1
        if @story.save
          @vs = VotedStory.new
          @vs[:user_id] = current_user[:id]
          @vs[:story_id] = @story[:id]
          @vs.save 
          flash[:success] = "You successfully liked this story!"
          redirect_to @story
        else
        #put something here
        end
      else
        flash[:warning] = "You have voted for this story"
        redirect_to @story
      end   
    end
  end

  def dislike
    @storyid = params[:id] 
    @story = Story.find(params[:id])
    if !signed_in?
      flash[:warning] = "You have to be signed in to vote!"
      redirect_to @story
    else
      #check if current_user has voted
      @votedstory = VotedStory.find_by_user_id_and_story_id(current_user.id,@storyid)
      if @votedstory == nil  
        @story[:dislike] = @story[:dislike]+1
        if @story.save
          @vs = VotedStory.new
          @vs[:user_id] = current_user[:id]
          @vs[:story_id] = @story[:id]
          @vs.save 
          flash[:success] = "You successfully disliked this story!"
          redirect_to @story
        else
        #put something here
        end
      else
        flash[:warning] = "You have voted for this story"
        redirect_to @story
      end   
    end
  end

  private
    def story_params
      params.require(:story).permit(:content, :title, :like, :dislike)
    end
end
