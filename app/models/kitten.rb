class Kitten < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :cuteness
  validates_presence_of :softness
end
