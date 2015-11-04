class DimensionsInPoll < ActiveRecord::Base
  belongs_to :dimension
  belongs_to :poll
end
