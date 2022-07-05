class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy

  validates :title, presence: true, length: { maximum: 60 }
  validates :body, presence: true, length: { maximum: 1_000 }
end
