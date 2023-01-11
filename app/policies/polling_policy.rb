# frozen_string_literal: true

class PollingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    @user.admin?
  end

  def create?
    @user.admin?
  end

  def edit?
    @user.admin? && !@record.poll_started?
  end

  def update?
    @user.admin? && !@record.poll_started?
  end

  def destroy?
    @user.admin? && !@record.poll_started?
  end

  def index?
    true
  end
end
