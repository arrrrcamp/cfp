set :application, "cfp"
set :repository,  "git@gitlab.openminds.be:arrrrcamp/cfp.git"
set :branch,      "master"

server 'pro-009.openminds.be', :app, :web, :db, primary: true
set :user, 'arrrrcamp2014'

set :configs, %w[database]

after 'deploy:update_code', 'symlinks:create'
namespace :symlinks do
  desc 'Create custom symlinks to shared and system folders'
  task :create do
    run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
  end
end
