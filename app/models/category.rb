class Category < Taxonomy
  has_many :evidences, through: :article_tags, source: :articable, source_type: "Evidence"
  has_many :questions, through: :article_tags, source: :articable, source_type: "Question"
end