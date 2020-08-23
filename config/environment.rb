ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'pg'
require 'dotenv'

Dotenv.load
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
  ActiveRecord::Base.establish_connection(
    :adapter  => "postgresql",
    :host     => "localhost",
    :username => "nolan",
    :password => "i090119",
    :database => "syo_development"
  )
 end
 
 configure :production do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')
 
  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
 end

require 'json'
require 'rack-flash'
require 'geocoder'
require 'will_paginate'
require 'will_paginate/active_record'
require 'mail'
require 'rack-flash'
require 'sinatra/flash'
require 'sinatra-initializers'

require './app/controllers/application_controller'
require './config/initializers/00-geocoder'
require_all 'app'
