class Post < ActiveRecord::Base
  belongs_to :user

  validates :content, presence: true
  validates :comments, presence: true
end
