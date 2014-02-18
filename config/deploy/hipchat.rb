##################################################
###### Begin sets
begin
  require 'hipchat/capistrano'
rescue LoadError
  raise "\nhipchat gem not found. Please install it with '(sudo) gem install hipchat' or add it to your Gemfile if you are using bundler."
end

set :hipchat_token, "ff3d16fd448c5e272265eab7c397b5"
set :hipchat_room_name, "ArrrrCamp"
set :hipchat_announce, false # notify users
set :hipchat_color, 'green' # finished deployment message color
set :hipchat_failed_color, 'red' # cancelled deployment message color
###### End sets
##################################################
