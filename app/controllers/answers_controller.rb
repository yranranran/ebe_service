class AnswersController < ApplicationController
  def create
    @answer = current_user.answers.build(answer_params)
    @answer.save
  end

  def destroy
    @answer = current_user.answers.find(params[:id])
    @answer.destroy!
  end

  def like_answers
    @like_answers = current_user.like_answers_answers.includes(:user).order(created_at: :desc)
  end

  def update
    @answer = current_user.answers.find(params[:id])
    if @answer.update(answer_update_params)
      render json: { answer: @answer }, status: :ok
    else
      render json: { answer: @answer, errors: { messages: @answer.errors.full_messages } }, status: :bad_request
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body).merge(question_id: params[:question_id])
  end

  def answer_update_params
    params.require(:answer).permit(:body)
  end
end
