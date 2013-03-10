# -*- encoding : utf-8 -*-
# General
set :application, "araguaia.defindex"
set :user, "railsapps"
set :domain, "192.34.57.10"

set :deploy_to, "/home/#{user}/sites/#{application}"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :remote, user
set :copy_cache, true
set :keep_releases, 3

set :use_sudo, false

ssh_options[:forward_agent] = true

# Bundler

require "bundler/capistrano"

#Asset Pipeline
load 'deploy/assets'

# Git
#This example is using local repository
set :scm, :git
set :repository, "git@bitbucket.org:mgswolf/araguaia.git"
set :branch, "master"

# Server

role :web, domain
role :app, domain
role :db,  domain, :primary => true

# Passenger

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
    #run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec script/delayed_job stop" rescue nil
    #run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec script/delayed_job start" rescue nil
  end


  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /opt/nginx/sites-enabled/#{application}"
    run "sudo /etc/init.d/nginx restart"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"
end