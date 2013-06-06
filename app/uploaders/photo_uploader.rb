class PhotoUploader < CarrierWave::Uploader::Base
  require 'carrierwave/processing/mini_magick'
  
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader
  storage :file

  # Override the directory where uploaded files will be stored
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  # Limit photos to 2 megapixels
  process :resize_to_limit_and_orientate => [2000, 2000]

  def resize_to_limit_and_orientate(width, height)
    manipulate! do |img|
      img.auto_orient
      img.resize "#{width}x#{height}>"
      img = yield(img) if block_given?
      img
    end
  end

  # Create different versions of your uploaded files
  version :thumb do
    process :resize_to_fill => [300, 300]
  end

  # Add a white list of extensions which are allowed to be uploaded
  def extension_white_list
    %w(jpg jpeg gif)
  end

  # Override the filename of the uploaded files
  # Avoid using model.id or version_name here, see uploader/store.rb for details
  def filename
    original_filename.downcase if original_filename.present?
  end
end
