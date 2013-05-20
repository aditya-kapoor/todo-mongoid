set :application, "todo-mongoid"
set :scm, :git
set :repository, "git@github.com:aditya-kapoor/todo-mongoid.git"
set :branch, "master"
set :user, "vinsol"
set :use_sudo, false
set :domain, "69.164.196.145"
set :rails_env, 'development'
set :scm_command, "/usr/bin/git"
set :deploy_to, "/var/www/apps/#{application}"
set :deploy_via, :remote_cache
set :keep_releases, 5

server domain, :app, :web, :db, :primary => true

namespace :unicorn do
  
  desc "Zero-downtime restart of Unicorn"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "kill -s USR2 `cat #{shared_path}/tmp/pids/unicorn.pid`"
  end

  desc "Start unicorn"
  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} ; bundle exec unicorn_rails -c config/unicorn.rb -D -E #{rails_env}"
  end

  desc "Stop unicorn"
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "kill -s QUIT `cat #{shared_path}/tmp/pids/unicorn.pid`"
  end  
end