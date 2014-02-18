set :application, "cfp"
set :repository,  "git@gitlab.openminds.be:arrrrcamp/cfp.git"
set :branch,      "master"

server 'pro-009.openminds.be', :app, :web, :db, primary: true
set :user, 'arrrrcamp2014'

set :configs, %w[database]
