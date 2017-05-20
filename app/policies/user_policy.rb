class UserPolicy < ApplicationPolicy

  def update?
    user.present? && user == record
  end

  def destroy?
    user.present? && user == record
  end
end
