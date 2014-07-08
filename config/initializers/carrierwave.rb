CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS', # required
    :aws_access_key_id      => APP_CONFIG['aws_access_key'], # required
    :aws_secret_access_key  => APP_CONFIG['aws_secret_access_key'], # required
  }
  config.fog_directory  = 'amplifyre-dev' # required

  config.storage = :file
  # config.storage = :fog
end

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_directory  = 'amplifyre'
    config.storage = :fog
  end
end
