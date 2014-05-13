class StaticPagesController < ApplicationController
require 'will_paginate/array'
  def home
    @stories = Story.all
    @condition = "front"
    @user = User.all
    @count = 0;
   
    @likedStories = Story.all
    @likedStories = @likedStories.sort_by{|e| -e[:like]}
    @likedStories = @likedStories[0..4]
  end
end
