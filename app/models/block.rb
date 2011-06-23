class Block < ActiveRecord::Base
  has_many :factors
  has_many :performances
end