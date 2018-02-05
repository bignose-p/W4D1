class ArtworksController < ApplicationController

  def index
    render json: Artwork.all
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
     render json: artwork
   else
     render json: artwork.errors.full_messages, status: :unprocessable_entity
   end
  end

  def show
    render json: Artwork.find(params[:id])
  end

  def update
    artwork = Artwork.find(params[:id])
    artwork.update!(artwork_params)
    if artwork.update
      render json: artwork
    else
    render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    Artwork.destroy(params[:id])

    render json: Artwork.all
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :artist_id, :image_url)

  end
end
