# frozen_string_literal: true

class ConstituenciesController < ApplicationController
  before_action :authorize_constituency, except: [:filter_constituencies]
  before_action :set_constituency, only: %i[edit update]

  def index
    @constituencies = Constituency.paginate(page: params[:page], per_page: 5)
  end

  def new
    @constituency = Constituency.new
  end

  def edit; end

  def create
    @constituency = Constituency.new(constituency_params)
    if @constituency.save
      flash[:notice] = 'Constituency was created successfully.'
      redirect_to constituencies_path
    else
      render 'new'
    end
  end

  def update
    if @constituency.update(constituency_params)
      flash[:notice] = 'Constituency was updated successfully.'
      redirect_to @constituency
    else
      render 'edit'
    end
  end

  def filter_constituencies
    constituencies = Constituency.all - current_user.applied_constituencies(params[:id])
    render json: constituencies
  end

  private

  def authorize_constituency
    authorize Constituency
  end

  def set_constituency
    @constituency = Constituency.find(params[:id])
  end

  def constituency_params
    params.require(:constituency).permit(:name)
  end
end
