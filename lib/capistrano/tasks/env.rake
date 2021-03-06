namespace :env do

  desc "update environment variables and restart application"
  task :update do
    invoke "env:upload"
    invoke "deploy:restart"
  end

  desc "upload environment variables"
  task :upload do
    puts "Are you sure you want to overwrite your current environment variables (stage: #{fetch(:stage)})?"
    puts "Varibles will be copied from lib/capistrano/templates/env.#{fetch(:stage)}"
    puts "This cannot be undone. Enter 'yes' to confirm. Any other response will abort."
    ask :confirm, "no"
    on roles(:all) do |host|
      if fetch(:confirm) =~ /\Ayes\z/i
        info "uploading templates/env.#{fetch(:stage)} ==> #{shared_path}/.env"
        env_config = template("env.#{fetch(:stage)}")
        destination_path = Pathname.new("#{shared_path}/.env")
        upload! StringIO.new(env_config), destination_path
      else
        info "aborting change of environment variables"
      end
    end
  end
  
end