class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      can :view, :instructor if user.has_role? :instructor
      can :view, :student if user.has_role? :student
    end
  end
end
