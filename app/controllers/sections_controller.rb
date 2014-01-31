class SectionsController < ApplicationController

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
  
end
