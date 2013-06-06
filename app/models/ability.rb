class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, Photo, assignment: { user_id: user.id }
      can :manage, Assignment, user_id: user.id
    end
  end
end
