# frozen_string_literal: true

class CandidateshipController < ApplicationController
  before_action :authorize_candidateship
  before_action :set_candidateship, only: %i[update destroy]

  def index
    @candidateships = Candidateship.order(:status)
  end

  def new
    @candidateship = Candidateship.new
  end

  def create
    @candidateship = Candidateship.new(candidateship_params)
    if @candidateship.save
      flash[:notice] = 'application was created in pending state'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @candidateship.update(status: params[:status])
      flash[:notice] = 'Status changed successfully'
    else
      flash[:alert] = @candidateship.errors.full_messages.join(', ').presence || ' Failed to change status'
    end
    redirect_to user_candidateship_index_path
  end

  def destroy
    @candidateship.destroy
    redirect_to user_candidateship_index_path
  end

  private

  def authorize_candidateship
    authorize Candidateship
  end

  def candidateship_params
    params.require(:candidateship).permit(:party_id, :polling_id, :constituency_id).tap do |whitelisted_params|
      whitelisted_params[:user_id] = current_user.id
    end
  end

  def set_candidateship
    @candidateship = Candidateship.find(params[:id])
  end
end
