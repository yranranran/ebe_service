class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :question_evidences
  has_many :evidences, through: :question_evidences
  has_many :article_tags, as: :articable, dependent: :destroy
  has_many :tags, through: :article_tags, as: :articable

  validates :title, presence: true, length: { maximum: 60 }
  validates :body, presence: true, length: { maximum: 1_000 }

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags.to_a - sent_tags.to_a
    new_tags = sent_tags.to_a - current_tags.to_a

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_question_tag = Tag.find_or_create_by(name: new)
      self.tags << new_question_tag
    end
  end
end
