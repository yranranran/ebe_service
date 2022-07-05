class Answer < ApplicationRecord
  before_create -> { self.uuid = SecureRandom.uuid }

  belongs_to :user
  belongs_to :question

  validates :body, presence: true, length: { maximum: 250 }
end
