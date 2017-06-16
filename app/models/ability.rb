class Ability
  include CanCan::Ability

  def initialize(dealer)
    if dealer.dealership_admins.any?
      can [:create, :new], [Dealership, Model, ]
      can :manage, Dealership, admin_id: dealer.id
      can :manage, Model, dealership: { id: dealer.dealership_admin_ids }
      can :manage, Picture do |picture|
        Model.joins(:dealership).where(dealerships: { admin_id: a.id }).pluck(:id).include?(picture.imageable_id) && picture.imageable_type.eql?("Model")
      end
    else
      can :read, :all
    end
  end
end
