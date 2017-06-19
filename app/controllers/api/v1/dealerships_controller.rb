class Api::V1::DealershipsController < ApplicationController

  def index
    @dealerships = Dealership.all
    render json: @dealerships
  end

  def show
    @dealership = Dealership.find(params[:id])
  end
end
