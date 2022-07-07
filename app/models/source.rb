class Source < ApplicationRecord
  has_many :evidences, through: :evidence_sources
  has_many :evidence_sources
  has_many :authors, through: source_authors
  has_many :source_authors
  
  enum evidence_level:{ ★☆☆☆: 1, ★★☆☆: 2, ★★★☆: 3, ★★★★: 4 }
  enum source_type:{ 論文:0, 書籍:1 }

  validates :title, presence: true, length: { maximum: 60 }
  validates :body, presence: true, length: { maximum: 65_000 }
end
