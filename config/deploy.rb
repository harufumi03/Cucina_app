lock "~> 3.10"    

set :application, "cucina_app"    
set :repo_url, "https://github.com/harufumi03/Cucina_app.git"    
set :linked_files, %w{config/secrets.yml}   
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/uploads}   
set :keep_releases, 5   
set :rbenv_ruby, '3.0.1'    
set :log_level, :info   

after 'deploy:published', 'deploy:seed'   
after 'deploy:finished', 'deploy:restart'  

namespace :deploy do
  desc 'Run seed'
  task :seed do
    on roles(:db) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end