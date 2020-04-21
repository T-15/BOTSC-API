CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'                        # required
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV["AWS_ACCESS_KEY"],                        # required
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],                        # required
      region:                ENV["AWS_REGION"],                  # optional, defaults to 'us-east-1'
      #host:                  's3.example.com',             # optional, defaults to nil
      #endpoint:              's3.ca-central-1.amazonaws.com' # optional, defaults to nil
    }
    #config.fog_directory  = ENV["AWS_FOG_DIRECTORY"]                                   # required
    config.fog_directory  = ENV["AWS_BUCKET"]                                 # required
    config.fog_public     = true                                                # optional, defaults to true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
  end
  