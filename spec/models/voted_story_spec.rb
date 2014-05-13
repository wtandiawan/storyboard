require 'spec_helper'

describe VotedStory do
  let(:user) { FactoryGirl.create(:user) }
  let(:story){ FactoryGirl.create(:story) }
  before do
  @votedstory = VotedStory.new(user_id: user.id, story_id: story.id);
  end
  it {should respond_to :story_id}
  it {should respond_to :user_id}
end
