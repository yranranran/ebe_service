class LikeAnswersController < ApplicationController
  skip_before_action :require_login, only: %i[create]

  def create
    @answer = Answer.find(params[:answer_id])
    if current_user.nil?
      if cookies[:like_answer_answer_id].nil?
        cookies.permanent[:like_answer_answer_id] = @answer.id.to_s
      else
        cookies.permanent[:like_answer_answer_id] = cookies.permanent[:like_answer_answer_id] + ',' + @answer.id.to_s
      end
      LikeAnswer.create(user_id: nil, answer_id: @answer.id)
      @cookies = cookies[:like_answer_answer_id]
    else
      current_user.like_answer(@answer)
    end
    @like_answers_count = @answer.like_answers.count
  end

  def destroy
    if current_user.present?
      @answer = current_user.like_answers.find(params[:id]).answer
      current_user.unlike_answer(@answer)
    end
  end
end
