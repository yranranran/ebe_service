class Question < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 60 }
  validates :body, presence: true, length: { maximum: 1_000 }
end
