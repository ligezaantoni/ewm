class CharacterTraitsController < ApplicationController
  before_action :load_and_authorize_character_trait,
    only: [:show, :edit, :update, :destroy]

  def index
    authorize CharacterTrait
    @character_traits = CharacterTrait.all
  end

  def show
  end

  def new
    @character_trait = CharacterTrait.new
    authorize @character_trait
  end

  def edit
  end

  def create
    @character_trait = CharacterTrait.new(character_trait_params)
    authorize @character_trait

    if @character_trait.save
      redirect_to @character_trait, notice: 'Character trait was successfully created.'
    else
      render :new
    end
  end

  def update
    if @character_trait.update(character_trait_params)
      redirect_to @character_trait, notice: 'Character trait was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @character_trait.destroy
    redirect_to character_traits_url, notice: 'Character trait was successfully destroyed.'
  end

  private

  def load_and_authorize_character_trait
    @character_trait = CharacterTrait.find(params[:id])
    authorize @character_trait
  end

  def character_trait_params
    params.require(:character_trait).permit(*policy(@character_trait || CharacterTrait).permitted_attributes)
  end
end
