# -*- encoding : utf-8 -*-
require 'bundler/capistrano'

# General
set :application, "arahidro"
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
#load 'deploy/assets'

# Git
#This example is using local repository
set :scm, :git
set :repository, "git@bitbucket.org:mgswolf/araguaia.git"
set :branch, "master"

# Server

role :web, domain
role :app, domain
role :db,  domain, :primary => true



#before "deploy",                 "deploy:delayed_job:stop"
#before "deploy:migrations",      "deploy:delayed_job:stop"

after  "deploy:update_code",     "deploy:symlink_config"
before "deploy:migrate",         "deploy:web:disable", "deploy:db:backup"

after  "deploy",                                      "deploy:cleanup"#, "deploy:delayed_job:restart"
after  "deploy:migrations",      "deploy:web:enable", "deploy:cleanup"#, "deploy:delayed_job:restart"

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

  desc "Link in the production database.yml and assets"
  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end



  namespace :delayed_job do
    desc "Restart the delayed_job process"
    task :restart, :roles => :app, :except => { :no_release => true } do
      run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec script/delayed_job restart" rescue nil
    end
    desc "Stop the delayed_job process"
    task :stop, :roles => :app, :except => { :no_release => true } do
      run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec script/delayed_job stop" rescue nil
    end
  end


  namespace :db do
    desc "backup of database before migrations are invoked"
    task :backup, :roles => :db, :only => { :primary => true } do
      filename = "#{deploy_to}/shared/db_backup/#{stage}_db.#{Time.now.utc.strftime("%Y-%m-%d_%I:%M")}_before_deploy.gz"
      text = capture "cat #{deploy_to}/current/config/database.yml"
      yaml = YAML::load(text)["#{stage}"]

      on_rollback { run "rm #{filename}" }
      run "mysqldump --single-transaction --quick -u#{yaml['username']} -h#{yaml['host']} -p#{yaml['password']} #{yaml['database']} | gzip -c > #{filename}"
    end
  end

  namespace :web do
    desc "Maintenance start"
    task :disable, :roles => :web do
      on_rollback { run "rm #{shared_path}/system/maintenance.html" }
      page = File.read("public/503.html")
      put page, "#{shared_path}/system/maintenance.html", :mode => 0644
    end

    desc "Maintenance stop"
    task :enable, :roles => :web do
      run "rm #{shared_path}/system/maintenance.html"
    end
  end
end

namespace :log do
  desc "A pinch of tail"
  task :tailf, :roles => :app do
    run "tail -n 10000 -f #{shared_path}/log/#{rails_env}.log" do |channel, stream, data|
      puts "#{data}"
      break if stream == :err
    end
  end
end
