class Task < ActiveRecord::Base
  has_many :users
  belongs_to :project

  validates :title, presence: true
  validates :content, presence: true


end
