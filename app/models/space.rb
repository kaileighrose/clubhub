class Space < ActiveRecord::Base
  has_many :meetings
  has_many :teams, through: :meetings

  def self.available_spaces(datetime)
    self.all.collect do |s|
      s.meetings.all? do |m|
        m.time > datetime || datetime > m.time
      end
    end
  end
end