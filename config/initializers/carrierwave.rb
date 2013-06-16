CarrierWave.configure do |config|
  config.storage = :file
  if Rails.env.production?
    config.asset_host = 'http://desolate-inlet-9998.herokuapp.com'
  else
    config.asset_host = 'http://adams-macbook-air.local:3000'
  end
end
