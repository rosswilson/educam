class Photo < ActiveRecord::Base
  attr_accessible :assignment_id, :caption, :device_id, :lat, :lon, :photo, :photo_cache, :tag_list
  
  belongs_to :assignment
  has_many :taggings
  has_many :tags, through: :taggings

  mount_uploader :photo, PhotoUploader

  validates :photo, :presence => true

  reverse_geocoded_by :lat, :lon do |obj, results|
    if results.first
      #obj.city = results.first.city
    end
  end
  
  after_validation :reverse_geocode, :if => lambda{ |obj| obj.lat_changed? or obj.lon_changed? }

  def self.tagged_with(name)
    Tag.find_by_name!(name).photos
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
  end
  
  def tag_list
    tags.map(&:name).join(", ")
  end
  
  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
