class QuestionEvidence < ApplicationRecord
  belongs_to :question
  belongs_to :evidence
end
