require 'spec_helper'

describe Story do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @story = Story.new(title: "Lorem",content: "Lorem ipsum", user_id: user.id,like: 0, dislike: 0)
  end
  subject { @story }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:like)}
  it { should respond_to(:dislike)}
  it { should respond_to(:title)}
  its(:user) { should eq user }
  
  it { should be_valid }

  describe "when user_id is not present" do
    before { @story.user_id = nil }
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @story.title = nil }
    it { should_not be_valid }
  end

    describe "when user_id is not present" do
    before { @story.user_id = nil }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @story.content = "a" * 1001 }
    it { should_not be_valid }
  end
end
