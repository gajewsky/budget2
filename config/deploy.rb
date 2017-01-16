# config valid only for Capistrano 3.1

set :application, 'budget2'
set :repo_url, 'git@github.com:gajewsky/prelang-budget.git'

set :deploy_to, '/home/deploy/budget'

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :bundle_binstubs, nil

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
