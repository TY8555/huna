CarrierWave.configure do |config|
#   config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIFLHLTBKDMACO75Q',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
    endpoint:              'http://s3.ap-northeast-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'lovehuna'                          # required
  config.fog_public     = true                                       # optional, defaults to true
  
end