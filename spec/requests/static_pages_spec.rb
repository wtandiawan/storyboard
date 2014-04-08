require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Storyboard'" do
      visit '/static_pages/home'
      expect(page).to have_content('Storyboard')
    end
  describe "Home page" do

    it "should have the title 'Storyboard'" do
      visit '/static_pages/home'
      expect(page).to have_title("Storyboard")
    end
  end
end
