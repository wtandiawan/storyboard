class CreateVotedStories < ActiveRecord::Migration
  def change
    create_table :voted_stories do |t|
      t.integer :user_id
      t.integer :story_id

      t.timestamps
    end
  end
end
