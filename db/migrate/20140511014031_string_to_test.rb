class StringToTest < ActiveRecord::Migration
  def change
     change_column :stories, :content, :text
  end
end
