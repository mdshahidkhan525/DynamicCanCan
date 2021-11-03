# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Item if user.role.permissions[:read]=="1" ? true : false
    can :create, Item if user.role.permissions[:write]=="1" ? true : false
    can :edit, Item if user.role.permissions[:write]=="1" ? true : false
    can :destroy, Item if user.role.permissions[:destroy]=="1" ? true : false
  end

end



