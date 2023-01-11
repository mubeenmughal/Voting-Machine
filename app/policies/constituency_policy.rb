# frozen_string_literal: true

class ConstituencyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    @user.admin?
  end

  def create?
    @user.admin?
  end

  def edit?
    @user.admin?
  end

  def update?
    @user.admin?
  end

  def index?
    @user.admin?
  end

  def filter_constituencies
    true
  end
end
