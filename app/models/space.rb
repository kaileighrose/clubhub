class Space < ActiveRecord::Base
  has_many :meetings
  has_many :teams, through: :meetings

  def self.available_spaces(datetime)
    self.all.collect do |s|
      s if s.meetings.all? {|m| m.time > datetime || datetime > m.time }
    end
  end
end