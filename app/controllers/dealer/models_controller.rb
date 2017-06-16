class Dealer::ModelsController < ApplicationController
  before_action :authenticate_dealer!
  load_and_authorize_resource except: :cars_list

  def new
    @model = Model.new
  end

  def create
    @model = Model.new(model_params)
    @dealership = Dealership.find(params[:dealership_id])
    if current_dealer.dealership_ids.include?(params[:dealership_id].to_i)
      dealership = Dealership.find(params[:dealership_id])
      @model.dealership_id =  dealership.id
    end
    if @model.save
      flash[:success] = "Car created"
      redirect_to dealer_dealership_model_path(@dealership, @model)
    else
      render 'new'
    end
  end

  def show
    @dealership = Dealership.find(params[:dealership_id])
    @model = Model.find(params[:id])
  end

  def cars_list
    make = Make.find(params[:id])
    render json: make.cars
  end

  private

  def model_params
    params.require(:model).permit(:car_id, :year, :price)
  end
end
