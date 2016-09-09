class Space < ActiveRecord::Base
  has_many :meetings
  has_many :teams, through: :meetings

  validates :name, :price, :capacity, presence: true
  validates :name, uniqueness: true


  def self.available_spaces(datetime)
    self.all.collect do |s|
      s if s.meetings.all? {|m| m.time > datetime || datetime > m.time }
    end
  end

end