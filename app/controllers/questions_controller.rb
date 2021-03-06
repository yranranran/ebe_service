class QuestionsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :find_question, only: %i[edit update destroy]

  def index
    @questions = Question.all.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @question = Question.new
    @categories = Category.all
  end

  def create
    @question = current_user.questions.build(question_params)
    sent_tags = params[:question][:name].split(',')
    if @question.save
      @question.save_tag(sent_tags)
      redirect_to questions_path, success: t('defaults.message.created', item: Question.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Question.model_name.human)
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.includes(:user).order(created_at: :desc)
  end

  def edit
    @categories = Category.all
    @tag_list = @question.tags.pluck(:name).join(',')
  end

  def update
    sent_tags = params[:question][:name].split(',')
    if @question.update(question_params)
      @old_relations = ArticleTag.where(articable_id: @question.id)
      @old_relations.each do |relation|
        relation.delete
      end
      @question.save_tag(sent_tags)
      redirect_to @question, alert: t('defaults.message.updated', item: Question.model_name.human)
    else
      flash.now[:alert] = t('defaults.message.not_updated', item: Qustion.model_name.human)
    end
  end

  def destroy
    @question.destroy!
    redirect_to questions_path, success: t('defaults.message.deleted', item: Question.model_name.human)
  end

  def bookmark_questions
    @bookmark_questions = current_user.bookmark_questions.includes(:user).order(created_at: :desc)
  end

  private

  def find_question
    @question = current_user.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body, :category_id, tag_ids: [])
  end
end