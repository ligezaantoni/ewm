class CharacterTraitsController < ApplicationController
  before_action :set_character_trait, only: [:show, :edit, :update, :destroy]

  # GET /character_traits
  def index
    @character_traits = CharacterTrait.all
  end

  # GET /character_traits/1
  def show
  end

  # GET /character_traits/new
  def new
    @character_trait = CharacterTrait.new
  end

  # GET /character_traits/1/edit
  def edit
  end

  # POST /character_traits
  def create
    @character_trait = CharacterTrait.new(character_trait_params)

    if @character_trait.save
      redirect_to @character_trait, notice: 'Character trait was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /character_traits/1
  def update
    if @character_trait.update(character_trait_params)
      redirect_to @character_trait, notice: 'Character trait was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /character_traits/1
  def destroy
    @character_trait.destroy
    redirect_to character_traits_url, notice: 'Character trait was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_trait
      @character_trait = CharacterTrait.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def character_trait_params
      params.require(:character_trait).permit(:name, :kind)
    end
end
