class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :like_answers, dependent: :destroy

  validates :body, presence: true, length: { maximum: 250 }
end
