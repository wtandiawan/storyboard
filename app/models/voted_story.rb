class VotedStory < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :story_id, presence: true 

end
