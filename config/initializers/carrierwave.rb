require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      aws_access_key_id: "rj43ru39rj4398rj3j34r3",
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      provider: 'AWS',
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'freemarket52d'
    config.cache_storage = :fog
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end
