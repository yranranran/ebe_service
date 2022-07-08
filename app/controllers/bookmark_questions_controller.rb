class BookmarkQuestionsController < ApplicationController
  def create
    question = Question.find(params[:question_id])
    current_user.bookmark(question)
    redirect_back fallback_location: root_path, alert: t('.success')
  end

  def destroy
    question = current_user.bookmark_questions.find(params[:id]).question
    current_user.unbookmark(question)
    redirect_back fallback_location: root_path, alert: t('.success')
  end
end
