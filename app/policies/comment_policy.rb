class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    user.present? && user == comment.user
  end

  def destroy?
    p comment.user
    p comment.post.user
    p user
    user.present? && (user == comment.user || user == comment.post.user)
  end

  private

  def comment
    record
  end
end
