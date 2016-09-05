class Space < ActiveRecord::Base
  has_many :meetings
  has_many :teams, through: :meetings

  def self.available_spaces(datetime)
    
  end
end
