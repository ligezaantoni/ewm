class RelatedPeopleController < ApplicationController
  before_action :set_related_person, only: [:show, :edit, :update, :destroy]

  # GET /related_people
  def index
    @related_people = RelatedPerson.all
  end

  # GET /related_people/1
  def show
  end

  # GET /related_people/new
  def new
    @related_person = RelatedPerson.new
  end

  # GET /related_people/1/edit
  def edit
  end

  # POST /related_people
  def create
    @related_person = RelatedPerson.new(related_person_params)

    if @related_person.save
      redirect_to @related_person, notice: 'Related person was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /related_people/1
  def update
    if @related_person.update(related_person_params)
      redirect_to @related_person, notice: 'Related person was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /related_people/1
  def destroy
    @related_person.destroy
    redirect_to related_people_url, notice: 'Related person was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_related_person
      @related_person = RelatedPerson.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def related_person_params
      params.require(:related_person).permit(:first_name, :last_name, :phone_number, :email, :role)
    end
end
