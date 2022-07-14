class ArticleTag < ApplicationRecord
  belongs_to :tag
  belongs_to :articable, polymorphic: true
end
