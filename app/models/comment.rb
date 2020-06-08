class Comment < ActiveRecord::Base
  belongs_to :location
  validates_presence_of :body

  self.per_page = 10

  def user 
    user = User.find_by(id: self.user_id)
  end
end
