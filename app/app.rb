class SYO < Sinatra::Base
  # Load intializers
  Dir['./config/initializers/*.rb'].sort.each { |file| require file }
end