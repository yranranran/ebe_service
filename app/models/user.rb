class User < ApplicationRecord
  authenticates_with_sorcery!
  acts_as_paranoid

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :user_name, presence: true, uniqueness: true, length: { maximum: 255 }

  enum role: { general: 0, editor: 1, admin: 2 }
end
