ENV['SINATRA_ENV'] ||= 'development'

require 'bundler/setup'
require 'pg'
require 'dotenv'

Dotenv.load
Bundler.require(:default, ENV['SINATRA_ENV'])

# Load intializers
Dir['./config/initializers/*.rb'].sort.each { |file| require file }

# Connect to Postgres cluster
app_dir = "/home/deploy/src/syo"

DB_CONFIGS = YAML.safe_load(ERB.new(File.read("#{app_dir}/current/config/database.yml")).result)
ActiveRecord::Base.establish_connection(DB_CONFIGS[ENV['APP_ENV']])

require 'json'
require 'rack-flash'
require 'geocoder'
require 'grape'
require 'will_paginate'
require 'will_paginate/active_record'
require 'mail'
require 'rack-flash'
require 'sinatra/flash'
require 'sinatra/jsonp'

Dir['./api/resources/*.rb'].sort.each { |file| require file }

require './app/app'

require_all 'app'
