require 'spec_helper'

describe "stories/edit" do
  before(:each) do
    @story = assign(:story, stub_model(Story,
      :content => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit story form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", story_path(@story), "post" do
      assert_select "input#story_content[name=?]", "story[content]"
      assert_select "input#story_user_id[name=?]", "story[user_id]"
    end
  end
end
