namespace :load do
  task :defaults do
    set :railstmp_roles, -> { :app }
  end
end

namespace :railstmp do
  desc 'Clear cache files'
  task :clear_cache do
    on roles(fetch(:railstmp_roles)) do
      within current_path do
        execute :bundle, :exec, :rake, 'tmp:cache:clear'
      end
    end
  end

  before 'deploy:restart', 'railstmp:clear_cache'
end
