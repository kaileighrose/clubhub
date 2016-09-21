module TeamsHelper

  def is_a_member(user)
    if @team.members != nil && @team.members.include?(user)
      true
    end
  end
end
