class Park < ApplicationRecord
  has_and_belongs_to_many :dogs
end
