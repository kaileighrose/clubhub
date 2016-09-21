module TeamsHelper

  def is_a_member(id)
    binding.pry
    if @team.members != nil && @team.members.include?(User.find(id))
      true
    end
  end
end
