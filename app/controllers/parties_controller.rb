# frozen_string_literal: true

class PartiesController < ApplicationController
  before_action :authorize_party
  before_action :set_party, only: %i[edit update destroy]

  def index
    @parties = Party.paginate(page: params[:page], per_page: 5)
  end

  def new
    @party = Party.new
  end

  def edit; end

  def create
    @party = Party.new(party_params)
    if @party.save
      flash[:notice] = 'Party was created successfully.'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @party.update(party_params)
      flash[:notice] = 'Party was updated successfully.'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @party.destroy
    redirect_to user_parties_path
  end

  private

  def authorize_party
    authorize Party
  end

  def set_party
    @party = Party.find(params[:id])
  end

  def party_params
    params.require(:party).permit(:name, :symbol)
  end
end
