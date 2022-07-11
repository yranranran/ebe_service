class LikeAnswersController < ApplicationController
  def create
    answer = Answer.find(params[:answer_id])
    current_user.like_answer(answer)
    redirect_back fallback_location: root_path, success: t('.success')
  end

  def destroy
    answer = current_user.like_answers.find(params[:id]).answer
    current_user.unlike_answer(answer)
    redirect_back fallback_location: root_path, success: t('.success')
  end
end
