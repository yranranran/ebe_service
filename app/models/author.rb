class Author < ApplicationRecord
  has_many :sources, through: source_authors
  has_many :source_authors

  validates :name, presence: true, length: { maximum: 255 }
end
