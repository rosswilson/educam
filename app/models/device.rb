class Device < ActiveRecord::Base
  attr_accessible :name, :notes
  has_many :photos
end
