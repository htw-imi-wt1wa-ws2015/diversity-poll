class Dimension < ActiveRecord::Base
  has_many :values
  has_many :dimensions_in_polls
  has_many :polls, through: :dimensions_in_polls
end
