class Evidence < ApplicationRecord
  belongs_to :user
  has_many :question_evidences
  has_many :questions, through: :question_evidences
  has_many :evidence_sources
  has_many :sources, through: :evidence_sources
  has_many :article_tags, as: :articable, dependent: :destroy
  has_many :tags, through: :article_tags, as: :articable

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
end
