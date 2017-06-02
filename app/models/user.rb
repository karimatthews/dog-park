class User < ApplicationRecord
  has_secure_password
  has_many :dogs

  validates_email_format_of :email, :message => 'is not looking good'

  def parks
    @parks ||= self.dogs.map { |dog| dog.parks }.flatten(1).uniq
  end


end
