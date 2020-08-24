require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::Cors do
  allow do
    origins 'localhost:9393', '127.0.0.1:9393'
            # regular expressions can be used here

    resource '/locations/*', :headers => 'x-domain-token'
    resource '/locations/all.json',
        methods: [:get, :post, :delete, :put, :patch, :options, :head],
        headers: 'x-domain-token',
        expose: ['Some-Custom-Response-Header'],
        max_age: 600
        # headers to expose
  end

  allow do
    origins '*'
    resource '/public/*', headers: :any, methods: :get

    # Only allow a request for a specific host
    resource '/locations/',
        headers: :any,
        methods: :get,
        if: proc { |env| env['HTTP_HOST'] == 'api.example.com' }
  end
end

use Rack::MethodOverride
run ApplicationController
use RolesController
use CheckInsController
use LocationsController
use CommentsController
use UsersController
