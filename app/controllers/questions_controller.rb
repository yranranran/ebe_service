class QuestionsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  before_action :find_question, only: %i[edit update destroy]

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

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question, alert: t('defaults.message.updated', item: Question.model_name.human)
    else
      flash.now[:alert] = t('defaults.message.not_updated', item: Qustion.model_name.human)
    end
  end

  def destroy
    @question.destroy!
    redirect_to questions_path, alert: t('defaults.message.deleted', item: Question.model_name.human)
  end

  private

  def find_question
    @question = current_user.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end
end