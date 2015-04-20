class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :display do
    process :eager => true
    process :resize_to_fill => [700, 700]
  end

  version :thumbnail do
    process :eager => true
    process :resize_to_fill => [250, 250, :face]
  end
  
  version :wide do
    process :eager => true
    process :resize_to_fill => [451, 250]
  end
  
  def default_url(*args)
    'http://res.cloudinary.com/cliquefashion/image/upload/v1429492207/Untitled2_of7fty.jpg'
  end

end
