# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    authorize User
    @user = User.find(params[:id])
  end
end
