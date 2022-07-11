class AnswersController < ApplicationController
  def create
    @answer = current_user.answers.build(answer_params)
    @answer.save
  end

  def destroy
    @answer = current_user.answers.find(params[:id])
    @answer.destroy!
  end

  private

  def answer_params
    params.require(:answer).permit(:body).merge(question_id: params[:question_id])
  end
end
