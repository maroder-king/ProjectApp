class Team < ActiveRecord::Base
  has_many :users
  has_many :projects

  validates :name, presence: true

end
