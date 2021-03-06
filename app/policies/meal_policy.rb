class MealPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where.not(latitude: nil, longitude: nil)
      scope.all
    end
  end

  def index?
    return true
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  def user_is_owner_or_admin?
    record.user == user || user.try(:admin)
  end
end
