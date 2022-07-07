class ArticleTag < ApplicationRecord
  belongs_to :taxonomy
  belongs_to :articable, polymorphic: true
end
