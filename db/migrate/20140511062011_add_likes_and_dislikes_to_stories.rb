class AddLikesAndDislikesToStories < ActiveRecord::Migration
  def change
    add_column :stories, :like, :integer
    add_column :stories, :dislike, :integer
  end
end
