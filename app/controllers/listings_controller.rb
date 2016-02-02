class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :update, :destroy]

  # GET /listings
  # GET /listings.json
  def index
    min_price = params[:min_price]
    max_price = params[:max_price]
    min_bed = params[:min_bed]
    max_bed = params[:max_bed]
    min_bath = params[:min_bath]
    max_bath = params[:max_bath]
    @listings = Listing.all
    @listings = @listings.where('price >= ?', min_price) if min_price
    @listings = @listings.where('price <= ?', max_price) if max_price
    @listings = @listings.where('bedrooms >= ?', min_bed) if min_bed
    @listings = @listings.where('bedrooms <= ?', max_bed) if max_bed
    @listings = @listings.where('bathrooms >= ?', min_bath) if min_bath
    @listings = @listings.where('bathrooms <= ?', max_bath) if max_bath

    render json: @listings, serializer: ListingSerializer
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    render json: @listing
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      render json: @listing, status: :created, location: @listing
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    @listing = Listing.find(params[:id])

    if @listing.update(listing_params)
      head :no_content
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy

    head :no_content
  end

  private

    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_params
      params[:listing]
    end
end
