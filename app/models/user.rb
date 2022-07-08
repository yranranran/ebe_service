class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :questions
  has_many :answers
  has_many :evidences
  has_many :bookmark_questions, dependent: :destroy
  has_many :bookmark_questions_questions, through: :bookmark_questions, source: :question

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  def own?(object)
    id == object.user_id
  end

  def bookmark(question)
    bookmark_questions_questions << question
  end

  def unbookmark(question)
    bookmark_questions_questions.destroy(question)
  end

  def bookmark?(question)
    bookmark_questions_questions.include?(question)
  end
end
