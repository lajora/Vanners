class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope
    # NOTE: Be explicit about which records you allow access to!
    # def initialize(user, scope)
    #   @user  = user
    #   @scope = scope
    # end

    def resolve
      scope.where(user: user)
    end
  end

  def show?
    return true
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
