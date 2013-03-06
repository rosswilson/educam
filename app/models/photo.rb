class Photo < ActiveRecord::Base
  attr_accessible :assignment_id, :caption, :device_id, :lat, :lon, :photo, :photo_cache
  
  belongs_to :assignment
  belongs_to :device

  mount_uploader :photo, PhotoUploader

  validates :photo, :presence => true

  reverse_geocoded_by :lat, :lon do |obj, results|
    if results.first
      #obj.city = results.first.city
    end
  end
  
  after_validation :reverse_geocode, :if => lambda{ |obj| obj.lat_changed? or obj.lon_changed? }
end
