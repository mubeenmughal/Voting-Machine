# frozen_string_literal: true

class PollingsController < ApplicationController
  include PollDetails

  before_action :authorize_polling, except: %i[edit update destroy]
  before_action :set_poll, only: %i[show edit update destroy]
  before_action :authorize_polling_instance, only: %i[edit update destroy]
  before_action :polling_params, only: [:create]

  def index
    @recent_polls = Polling.recent_polls
    @coming_polls = Polling.coming_polls
    @active_polls = Polling.active_polls
  end

  def new
    @poll = Polling.new
  end

  def create
    @poll = Polling.new(polling_params)
    if @poll.save
      flash[:notice] = 'polling created'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    load_poll_details
  end

  def edit; end

  def update
    if @poll.update(polling_params)
      flash[:notice] = 'Party was updated successfully.'
      redirect_to pollings_path
    else
      render 'edit'
    end
  end

  def destroy; end

  private

  def authorize_polling
    authorize Polling
  end

  def authorize_polling_instance
    authorize @poll
  end

  def polling_params
    params.require(:polling).permit(:start_time, :end_time)
  end

  def set_poll
    @poll = Polling.find(params[:id])
  end
end
