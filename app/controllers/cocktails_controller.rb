class CocktailsController < ApplicationController

  # before_action :find_cocktail, only: [:show, :view]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_dose_path(@cocktail)
    else
      render :new
    end
  end

  # -- Não implementar ainda --
  def edit
  end

  def update
  end

  def delete
  end
  # ----------------------------
  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  # def find_cocktail
  #   @cocktail = Cocktail.find(params[:id])
  # end
end
