class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show destroy edit update]
  def show
    @question = @question.decorate
    @answer = @question.answers.build
    @pagy, @answers = pagy @question.answers.order(created_at: :desc)
    @answers = @answers.decorate
    #kaminary - @question.answers.order created_at: :desc
    #Answer.where(question: @question).order created_at: :desc
  end
  def destroy
    @question.destroy
    flash[:success] = "Question deleted!"
    redirect_to questions_path
  end

  def index
    @pagy, @questions = pagy Question.order(created_at: :desc)
    @questions = @questions.decorate
    #kaminary - @questions = Question.order(created_at: :desc).page params[:page]
  end

  def update
    if @question.update questions_params
      flash[:success] = "Question updated!"
      redirect_to questions_path
    else
      render :edit
    end
  end
  def new
    @question = Question.new
  end

  def create
    @question = Question.new questions_params
    if @question.save
      flash[:success] = "Question created!"
      redirect_to questions_path
    else
      render :new
    end

  end

  def edit
  end

  private
  def questions_params
    params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find params[:id]
  end
end
