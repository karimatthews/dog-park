class Dog < ApplicationRecord
  has_and_belongs_to_many :parks
  belongs_to :user
  def authorize(user)
    self.user == user 
  end
end
