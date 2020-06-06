class Comment < ActiveRecord::Base
  belongs_to :location
  validates_presence_of :body
end
