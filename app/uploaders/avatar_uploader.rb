# encoding: utf-8
require 'carrierwave/processing/mini_magick'

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [200,200]
  end

  version :icon do
    process :resize_to_fit => [50,50]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
