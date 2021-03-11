class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :update, :destroy]

  # GET /countries
  def index
    @countries = Country.all

    render json: @countries.as_json(include: {reviews: {only: [:id, :city_visited, :date_visited, :experience,:likes]}})
  end

  # GET /countries/1
  def show
    render json: @country.as_json(include: {reviews: {only: [:id, :city_visited, :date_visited, :experience, :likes]}})
  end


  # POST /countries
  def create
    @country = Country.new(country_params)
    if @country.save
      render json: @country.as_json(include: {reviews: {only: [:id, :city_visited, :date_visited, :experience, :likes]}})
    else
      render json: @country.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /countries/1
  def update
    if @country.update(country_params)
      render json: @country.as_json(include: {reviews: {only: [:id, :city_visited, :date_visited, :experience, :likes]}})
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # DELETE /countries/1
  def destroy
    @country.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find_by_id(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def country_params
      params.require(:country).permit(:id, :name, :continent, :image, :reviews_attributes => [:id, :city_visited, :date_visited, :experience, :likes, :country_id])
    end
end
