class Assignment < ActiveRecord::Base
  attr_accessible :description, :title, :user_id
  has_many :photos
end
