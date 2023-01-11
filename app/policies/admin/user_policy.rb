# frozen_string_literal: true

module Admin
  class UserPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end

    def index?
      @user.role == 'admin'
    end
  end
end
