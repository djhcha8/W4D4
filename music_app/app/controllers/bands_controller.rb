class BandsController < ApplicationController
  def index
    #render
    # debugger
    @bands = Band.all
    render :index
  end

  def new
    #render
  end

  def create
    #logic for creating
    band = Band.new(bands_params)

    if band.save
      redirect_to bands_url
    else
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
    #render
  end


  def update
    #logic for updating
    @band = Band.find(params[:id])

    if @band.update!(bands_params)
      redirect_to bands_url
    else
      render :edit
    end
  end

  def show
    #render
    @band = Band.find(params[:id])
  end

  def destroy
    #logic for destoring
    @band = Band.find(params[:id])
    if @band
      @band.destroy
    end
    redirect_to bands_url
  end

  private

  def bands_params
    params.require(:band).permit(:name)
  end
end
