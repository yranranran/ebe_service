class Tag < Taxonomy
  has_many :article_tags
  has_many :articles, through: :article_tags, as: :articable
end