class Dog < ApplicationRecord
  has_many :walks
  has_many :parks, through: :walks
  belongs_to :user

  def authorize(user)
    self.user == user
  end
end
