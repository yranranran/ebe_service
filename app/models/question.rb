class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :evidences, through: :question_evidences
  has_many :question_evidences
  has_many :taxonomies, through: :article_tags
  has_many :article_tags

  validates :title, presence: true, length: { maximum: 60 }
  validates :body, presence: true, length: { maximum: 1_000 }
end
