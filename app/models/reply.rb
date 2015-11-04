class Reply < ActiveRecord::Base
  belongs_to :dimension
  belongs_to :value
end
