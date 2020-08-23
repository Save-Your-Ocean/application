require 'singleton'
require 'geocoder/configuration_hash'

module Geocoder

  # Configuration options should be set by passing a hash:
  
    Geocoder.configure(
      :timeout  => 5,
      :lookup   => :yandex,
      :units    => :km
    )
  
  
end