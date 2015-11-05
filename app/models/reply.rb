class Reply < ActiveRecord::Base
  belongs_to :poll
  belongs_to :dimension
  belongs_to :value
end
