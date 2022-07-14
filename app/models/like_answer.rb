class LikeAnswer < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :answer

  validates :user_id, uniqueness: { scope: :answer_id }
end
