class StaticPagesController < ApplicationController
require 'will_paginate/array'
  def home
    @stories = Story.find(:all)
    @condition = "front"
    @user = User.find(:all)
  end
end
