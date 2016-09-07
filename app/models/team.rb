require 'pry'
class Team < ActiveRecord::Base
  has_and_belongs_to_many :members, :class_name => "User"
  has_many :meetings

  accepts_nested_attributes_for :members

  def members_attributes=(members)
    binding.pry
    members.each do |member|
      self.members << User.find_or_create_by(name: member.name)
    end
    self.members.update
  end
end
