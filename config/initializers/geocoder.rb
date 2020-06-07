require 'singleton'
require 'geocoder/configuration_hash'

module Geocoder

  Configuration options should be set by passing a hash:
  
    Geocoder.configure(
      :timeout  => 5,
      :lookup   => :google,
      :api_key  => "AIzaSyAXGTrxMiOw8VFOsEwAjN8hDQVXA5_4Cfk",
      :units    => :km
    )
  
  
end