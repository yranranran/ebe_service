class SourceAuthor < ApplicationRecord
  belongs_to :author
  belongs_to :source
end
