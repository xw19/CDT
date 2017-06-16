class Dealer::ImagesController < ApplicationController
  before_action :authenticate_dealer!

  def index
    @dealership = Dealership.find(params[:dealership_id])
    @model = Model.find(params[:model_id])
    @images = @model.pictures
    authorize! :show, @dealership
    authorize! :show, @model
  end

  def new
    @dealership = Dealership.find(params[:dealership_id])
    @model = Model.find(params[:model_id])
    authorize! :show, @dealership
    authorize! :show, @model
    @picture = @model.pictures.build
  end


  def create
    @dealership = Dealership.find(params[:dealership_id])
    @model = Model.find(params[:model_id])
    authorize! :show, @dealership
    authorize! :show, @model
    @picture = Picture.new(picture_params)
    @picture.imageable_id = @model.id
    @picture.imageable_type = "Model"
    if @picture.save
      flash[:success] = "Image added"
      redirect_to dealer_dealership_model_images_path
    else
      render 'new'
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:image)
  end
end
