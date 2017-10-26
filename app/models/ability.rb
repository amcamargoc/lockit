class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :receptionist
      can :manage, Recipient
      can :manage, LockerBox
      can :manage, Parcel
      cannot :manage, User

    else
      cannot :manage, :all
    end
  end
end
