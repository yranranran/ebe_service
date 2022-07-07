class Source < ApplicationRecord
  enum evidence_level:{ ★☆☆☆: 1, ★★☆☆: 2, ★★★☆: 3, ★★★★: 4 }
  enum source_type:{ 論文:0, 書籍:1 }
end
