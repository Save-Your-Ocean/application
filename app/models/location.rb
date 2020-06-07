class Location < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  
  has_many :location_managers
  has_many :users, through: :location_managers, source: :user
  validates_presence_of :name, :address, :city, :country
  geocoded_by :address
  after_validation :geocode 

  def address
    [street, city, country].compact.join(', ')
  end
  
end
