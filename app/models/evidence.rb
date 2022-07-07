class Evidence < ApplicationRecord
  belongs_to :user
  has_many :questions, through: :question_evidences
  has_many :question_evidences

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
end
