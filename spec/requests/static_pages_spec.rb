require 'spec_helper'
describe "Static pages" do

  subject{ page }
  describe "home page" do
    before {visit root_path}
   
    it {should have_content('Storyboard')}
  end
end 
