class AnswersController < ApplicationController
  def create
    answer = current_user.answers.build(answer_params)
    if answer.save
      redirect_to question_path(answer.question), alert: t('defaults.message.created', item: Answer.model_name.human)
    else
      redirect_to question_path(answer.question), alert: t('defaults.message.not_created', item: Answer.model_name.human)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body).merge(question_id: params[:question_id])
  end
end
