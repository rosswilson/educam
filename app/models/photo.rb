class Photo < ActiveRecord::Base
  attr_accessible :assignment_id, :caption, :device_id, :lat, :lon, :photo
end
