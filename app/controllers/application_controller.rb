# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  include ApplicationHelper
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name cnic constituency_id picture])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: %i[name picture])
    devise_parameter_sanitizer.permit(:invite, keys: %i[cnic constituency_id role])
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referer || root_path)
  end

  def record_not_found
    flash[:alert] = 'Record not found'
    redirect_to(request.referer || root_path)
  end
end
