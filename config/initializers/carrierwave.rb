require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAWOEBS25OXJLE4SMV',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1',
      path_style: true
    }
  
    config.fog_directory = 'satisfactorycreate'
    config.cache_storage = :fog
    config.fog_public = false
  end
end