class AlbumsController < ApplicationController
  def new
  end

  def create
    album = Album.new(ablums_params)

    if album.save!
      redirect_to band_url(album.band_id)
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    album = Album.find(params[:id])
    if album.update!
      redirect_to band_url(album.band_id)
    else
      render :edit
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def destroy
    album = Album.find(params[:id])
    if album
      album.destroy
      redirect_to band_url(album.band_id)
    else
      redirect_to band_url(album.band_id)
    end
  end

  private

  def ablums_params
    params.require(:album).permit(:title, :year, :live, :band_id)
  end
end
