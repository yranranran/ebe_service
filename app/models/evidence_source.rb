class EvidenceSource < ApplicationRecord
  belongs_to :evidence
  belongs_to :source
end
