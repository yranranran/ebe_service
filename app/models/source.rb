class Source < ApplicationRecord
  has_many :evidences, through: :evidence_sources
  has_many :evidence_sources
  
  enum evidence_level:{ ★☆☆☆: 1, ★★☆☆: 2, ★★★☆: 3, ★★★★: 4 }
  enum source_type:{ 論文:0, 書籍:1 }
end
