class QuestionsController < ApplicationController
  layout "sections"

  before_action :authenticate
  before_action :authorize
  before_action :get_layout_variables

  def index
    @section = Section.find(params[:section_id])
    @questions = @section.questions.order("created_at")
    
    check_pjax
  end

  def create
    strong_params = params.require(:question).permit(:title)
    @question = Question.new strong_params
    @question.section_id = params[:section_id]

    if @question.save
      redirect_to section_questions_path(params[:section_id])
    else
      @questions = @question.section.questions.order("created_at")
      render 'index'
    end
  end

  def edit
    @question = Question.find params[:id]
    check_pjax
  end

  def update
    strong_params = params.require(:question).permit(:title, :answer)
    @question = Question.find params[:id]

    if @question.update(strong_params)
      redirect_to section_questions_path(@question.section), 
                  notice: "#{@question.title} successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find params[:id]
    @question.destroy

    redirect_to section_questions_path(@section)
  end

  private

  def authenticate
    redirect_to new_user_session_path   unless user_signed_in?
  end

  def authorize
    section = Section.find_by(id: params[:section_id])
    question = Question.find_by(id: params[:id])
    
    section_condition = section &&  section.reading.user.id == current_user.id
    question_condition = question &&  question.section.reading.user.id == current_user.id

    unless section_condition || question_condition
      redirect_to readings_path
    end
  end

  def get_layout_variables
    @section = Section.find params[:section_id] || Question.find(params[:id]).section
    @reading = @section.reading
    @sections = @reading.sections.order("created_at")
  end
  
  def check_pjax
    if request.headers['X-PJAX']
      render layout: false
    end
  end
end
