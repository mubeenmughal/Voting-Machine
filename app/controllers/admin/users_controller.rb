# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    def index
      authorize User, policy_class: Admin::UserPolicy
      @users = User.joins(:constituency)
    end
  end
end
