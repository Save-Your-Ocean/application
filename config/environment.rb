ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite"
)
require 'json'
require 'rack-flash'
require 'geocoder'
require 'will_paginate'
require 'will_paginate/active_record'

require './app/controllers/application_controller'
require_all 'app'
