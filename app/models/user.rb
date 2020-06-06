class User < ActiveRecord::Base
  has_secure_password
  # has_secure_password :recovery_password
  has_many :location_managers
  has_many :comments, through: :locations
  has_many :managed_locations, through: :location_managers, source: :location
  validates_presence_of :username, :password, :confirmation =>true
  validates :username, uniqueness: true
  belongs_to :role

end
