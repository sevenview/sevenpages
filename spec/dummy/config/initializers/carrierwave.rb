CarrierWave.configure do |config|
  case Rails.env
    when 'production', 'staging'
    config.storage = :fog
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: ENV['S3_ACCESS_KEY'],
        aws_secret_access_key: ENV['S3_SECRET_KEY']
    }
    config.fog_directory = ENV['S3_BUCKET_NAME']
    config.fog_public    = true

    when 'test'
    config.storage = :file
    config.enable_processing = false

    when 'development'
    config.storage = :file
  end
end