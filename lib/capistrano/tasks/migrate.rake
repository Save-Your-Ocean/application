namespace :deploy do
  # NOTE: You should do migration only on one server. So here we do it in sequence so
  # that only one server really gets the work done.
  after :updating, :migrate do
    on roles(:db), in: :sequence, wait: 15 do
      within release_path do
        with rack_env: fetch(:stage) do
          execute :rake, 'db:migrate'
        end
      end
    end
  end

  before :finished, :restart_server do
    on roles(:app), in: :parallel do
      within release_path.join('tmp') do
        execute :touch, 'restart.txt'
      end
    end
  end

end