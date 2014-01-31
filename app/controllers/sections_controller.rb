class SectionsController < ApplicationController
  before_action :authenticate
  before_action :authorize

  def index
    @reading = Reading.find params[:reading_id]
    @sections = @reading.sections
  end

  def new
    @reading = Reading.find params[:reading_id]
    @sections = @reading.sections
    @section = Section.new
    @section.reading = @reading
  end

  def create
    @reading = Reading.find params[:reading_id]
    @sections = @reading.sections

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
  end

  def update
  end

  def destroy
  end


  def notes
    @section = Section.find params[:id]
    @reading = @section.reading
    @sections = @reading.sections
    
  end

  def update_notes
    
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
end
