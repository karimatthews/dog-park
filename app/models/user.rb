class User < ApplicationRecord
  has_secure_password
  has_many :dogs

  def parks
    @parks ||= self.dogs.map { |dog| dog.parks }.flatten(1).uniq
  end
end
