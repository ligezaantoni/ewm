class RelatedPeopleController < ApplicationController
  before_action :load_and_authorize_related_person,
    only: [:show, :edit, :update, :destroy]

  def index
    authorize RelatedPerson
    @related_people = RelatedPerson.all
  end

  def show
  end

  def new
    @related_person = RelatedPerson.new
    authorize @related_person
  end

  def edit
  end

  def create
    @related_person = RelatedPerson.new(related_person_params)
    authorize @related_person

    if @related_person.save
      redirect_to @related_person, notice: 'Related person was successfully created.'
    else
      render :new
    end
  end

  def update
    if @related_person.update(related_person_params)
      redirect_to @related_person, notice: 'Related person was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @related_person.destroy
    redirect_to related_people_url, notice: 'Related person was successfully destroyed.'
  end

  private

  def load_and_authorize_related_person
    @related_person = RelatedPerson.find(params[:id])
    authorize @related_person
  end

  def related_person_params
    params.require(:related_person).permit(*policy(@related_person || RelatedPerson).permitted_attributes)
  end
end
