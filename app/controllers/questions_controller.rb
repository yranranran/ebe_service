class QuestionsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @questions = Question.all.includes(:user).order(created_at: :desc)
  end
end