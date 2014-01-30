class ReadingsController < ApplicationController
  before_action :authenticate
  before_action :authorize, only: [:edit, :update, :destroy]

  def index
    @readings = current_user.readings
  end

  def create
    @reading = Reading.new strong_params
    @reading.user = current_user
    
    if @reading.save
      redirect_to readings_path
    else
      @readings = current_user.readings
      render 'index'
    end
  end

  def edit

  end

  def update
    
  end

  def destroy
    @reading = Reading.find params[:id]
    @reading.destroy
    redirect_to 'index', notice: "#{@reading.title} deleted succesfully"
  end


  private
  def authenticate
    redirect_to new_user_session_path   if !user_signed_in?
  end

  def authorize
    unless Reading.exists?(params[:id]) && 
      current_user.id == Reading.find(params[:id]).user.id
        redirect_to readings_path
    end
  end

  def strong_params
    params.require(:reading).permit(:title)
  end
end
