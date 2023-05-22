class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process resize_to_limit: [300, 300]
  process :set_quality

  def set_quality
    manipulate! do |img|
      img.quality(80)
      img = yield(img) if block_given?
      img
    end
  end

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
