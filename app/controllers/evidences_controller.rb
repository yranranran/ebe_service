class EvidencesController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  def index
    @evidences = Evidence.all.order(created_at: :desc)
  end
end
