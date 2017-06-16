class Dealer::DealershipsController < ApplicationController
  before_action :authenticate_dealer!
  load_and_authorize_resource

  def index
    @dealership_admins = current_dealer.dealerships.where(admin: current_dealer)
    @dealerships = current_dealer.dealerships.where.not(admin: current_dealer)
  end

  def show
    @dealership = Dealership.find(params[:id])
    @models = @dealership.models
  end
end
