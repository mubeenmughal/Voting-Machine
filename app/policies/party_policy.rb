# frozen_string_literal: true

class PartyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    @user.admin?
  end

  def update?
    @user.admin?
  end

  def new?
    true
  end

  def create?
    true
  end

  def index?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end
end
