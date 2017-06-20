class Api::V1::ModelsController < ApplicationController
  def index
    sleep 3
    @dealership = Dealership.find(params[:dealership_id])
    @models = @dealership.models
  end

  def show
    @dealership = Dealership.find(params[:dealership_id])
    @model = @dealership.models.find(params[:id])
  end
end
