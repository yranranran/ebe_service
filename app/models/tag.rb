class Tag < Taxonomy
  has_many :article_tags, dependent: :destroy
  has_many :evidences, through: :article_tags, source: :articable, source_type: "Evidence"
  has_many :questions, through: :article_tags, source: :articable, source_type: "Question"
end