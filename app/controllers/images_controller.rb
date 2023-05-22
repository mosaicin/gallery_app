class ImagesController < ApplicationController
  def new
    @image = Image.new
  end
  def index
     @images = Image.all
  end
  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to @image, notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:title, :description, :image)
  end
end
