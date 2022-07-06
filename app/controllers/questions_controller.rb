class QuestionsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @questions = Question.all.includes(:user).order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to questions_path, alert: t('defaults.message.created', item: Question.model_name.human)
    else
      flash.now[:alert] = t('defaults.message.not_created', item: Question.model_name.human)
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.includes(:user).order(created_at: :desc)
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end