class Location < ActiveRecord::Base
  has_many :location_managers
  has_many :users, through: :location_managers, source: :user
  validates_presence_of :name, :address, :city, :country
end
