class BookmarkQuestionsController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    current_user.bookmark(@question)
  end

  def destroy
    @question = current_user.bookmark_questions.find(params[:id]).question
    current_user.unbookmark(@question)
  end
end
