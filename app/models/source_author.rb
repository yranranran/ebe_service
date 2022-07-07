class SourceAuthor < ApplicationRecord
  belongs_to :author
  belongs_to :source
  has_many :sources, through: source_authors
  has_many :source_authors
end
