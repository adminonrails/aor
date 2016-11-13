class AdminAbility
  include CanCan::Ability

  def initialize(user)
    case user
    when :admin
      can :manage, :all
    when :manager
      can [:index], :article
    end
  end
end
