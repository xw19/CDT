class Api::V1::ModelsController < ApplicationController
  def show
    @dealership = Dealership.find(params[:dealership_id])
    @model = @dealership.models.find(params[:id])
  end
end
