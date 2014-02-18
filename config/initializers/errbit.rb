Airbrake.configure do |config|
  config.api_key = '2e74b8d725d005e55644452a01100e8b'
  config.host    = 'errbit.openminds.be'
  config.port    = 443
  config.secure  = config.port == 443
end
