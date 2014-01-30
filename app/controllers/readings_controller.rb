class ReadingsController < ApplicationController
  before_action :authenticate
  before_action :authorize, only: [:edit, :update, :destroy]

  def index

  end

  def edit

  end

  def update
    
  end

  def destroy
    
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
end
