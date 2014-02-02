class SectionsController < ApplicationController
  before_action :authenticate
  before_action :authorize
  before_action :find_reading_and_sections, only: [:index, :new, :create]

  def index
  end

  def new
    @section = Section.new
    @section.reading = @reading
  end

  def create
    strong_params = params.require(:section).permit(:name)
    @section = Section.new strong_params
    @section.reading = @reading

    if @section.save
      redirect_to reading_sections_path(@reading)
    else
      render 'new'
    end
  end

  def edit
    @section = Section.find params[:id]
    @reading = @section.reading
    @sections = @reading.sections
  end

  def update
    strong_params = params.require(:section).permit(:name)
    @section = Section.find params[:id]

    if @section.update(strong_params)
      redirect_to @section, notice: "#{@section.name} succesfully updated"
    else
      @reading = @section.reading
      @sections = @reading.sections
      render 'edit'
    end
  end

  def destroy
    @section = Section.find params[:id]
    @section.destroy
    redirect_to reading_sections_path(@section.reading)
  end


  def notes
    @section = Section.find params[:id]
    @reading = @section.reading
    @sections = @reading.sections
  end

  def update_notes
    strong_params = params.require(:section).permit(:notes)
    @section = Section.find params[:id]

    if @section.update(strong_params)
      redirect_to notes_section_path(@section)
    else
      @reading = @section.reading
      @sections = @reading.sections
      render 'notes'
    end
  end
  

  private

  def authenticate
    redirect_to new_user_session_path  unless user_signed_in?
  end

  def authorize
    reading_condition = Reading.exists?(params[:reading_id]) && 
      current_user.id == Reading.find(params[:reading_id]).user.id

    section_condition = Section.exists?(params[:id])  && 
      current_user.id == Section.find(params[:id]).reading.user.id

    unless reading_condition || section_condition
      redirect_to readings_path
    end
  end

  def find_reading_and_sections
    @reading = Reading.find params[:reading_id]
    @sections = @reading.sections
  end
end
