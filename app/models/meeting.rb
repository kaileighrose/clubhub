class Meeting < ActiveRecord::Base
  belongs_to :team
  belongs_to :space
end
