class Story < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order('created_at DESC') }
    
  validates :content, length: {maximum: 1000}
  validates :user_id, presence: true
end
