class Poll < ActiveRecord::Base
  has_many :dimensions_in_polls
  has_many :dimensions, through: :dimensions_in_polls
end
