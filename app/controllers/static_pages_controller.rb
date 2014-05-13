class StaticPagesController < ApplicationController
require 'will_paginate/array'
  def home
    @stories = Story.find(:all)
    @condition = "front"
    @user = User.find(:all)
    @count = 0;
   
    @likedStories = Story.find(:all)
    @likedStories = @likedStories.sort_by{|e| -e[:like]}
    @likedStories = @likedStories[0..4]
    
  end
end
