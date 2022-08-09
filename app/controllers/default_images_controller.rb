class DefaultImagesController < ApplicationController
  def new
  end
  def create
    d_image = DImage.new(value: params[:value])
    d_image.default_image.attach(params[:default_image])
    d_image.save
    render plain: "Success"
  end



end
