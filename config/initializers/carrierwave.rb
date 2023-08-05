require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory  = 'satisfactorycreate'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AKIAWOEBS25OXJLE4SMV'],
    aws_secret_access_key: ENV['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'],
    region: ENV['ap-northeast-1'],
    path_style: true
  }

end