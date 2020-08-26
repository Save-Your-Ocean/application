with rack_env: "production" do
  #
  # migration
  #
  set :migration_role, :db
  set :migration_servers, -> { primary(fetch(:migration_role)) }
  namespace :deploy do
    desc 'Runs rake db:migrate if needed'
    task :migrate do
      on fetch(:migration_servers) do
        if test("diff -q #{release_path}/db/migrate #{current_path}/db/migrate")
          info '[deploy:migrate] Skip `deploy:migrate` (nothing changed in db/migrate)'
        else
          info '[deploy:migrate] Run `rake db:migrate`'
          invoke :'deploy:do_migrate'
        end
      end
    end
  
    desc 'Runs rake db:migrate'
    task :do_migrate do
      on fetch(:migration_servers) do
        within release_path do
          with rack_env: "production" do
            execute :rake, 'db:migrate'
          end
        end
      end
    end
  
    after 'deploy:updated', 'deploy:migrate'
  end
end
