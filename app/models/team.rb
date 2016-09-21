require 'pry'
class Team < ActiveRecord::Base
  has_and_belongs_to_many :members, :class_name => "User"
  has_many :meetings

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :members

  def add_members(members)
    members.each do |member|
      if member != nil && member != ""
        self.members << User.find(member)
      end
    end
  end
end
