class LikeAnswersController < ApplicationController
  def create
    @answer = Answer.find(params[:answer_id])
    current_user.like_answer(@answer)
  end

  def destroy
    @answer = current_user.like_answers.find(params[:id]).answer
    current_user.unlike_answer(@answer)
  end
end
