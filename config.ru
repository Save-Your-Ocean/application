require './config/environment'
require './app/app'
require './api/api'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::Cors do
  allow do
    origins 'localhost:9393'
    resource '*', headers: :any, methods: %i[get post put delete options]
  end
end

use Rack::MethodOverride
use Rack::Session::Cookie
run Rack::Cascade.new [Web, SYO::API]
