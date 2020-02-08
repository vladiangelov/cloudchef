class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def show?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  def user_is_owner_or_admin?
    record.user == user || user.try(:admin)
  end
end
